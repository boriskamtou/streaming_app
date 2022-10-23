import 'package:movie_app/src/auth/sign_up/shared/provider.dart';
import 'package:movie_app/src/core/infrastructure/common_import.dart';
import 'package:movie_app/src/core/presentation/routes/app_router.gr.dart';
import 'package:movie_app/src/setup_account/choose_your_interest/shared/providers.dart';

import '../../core/shared/widgets/skip_or_continue_buttons.dart';

class ChooseYourInterestScreen extends StatefulHookConsumerWidget {
  const ChooseYourInterestScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChooseYourInterestScreenState();
}

class _ChooseYourInterestScreenState
    extends ConsumerState<ChooseYourInterestScreen> {
  @override
  Widget build(BuildContext context) {
    final interests =
        ref.watch(chooseInterestNotifierProvider.notifier).listOfInterets;
    final selectedInterests = ref
        .watch(chooseInterestNotifierProvider.notifier)
        .listOfSeletedInterets;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Interest'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(firebaseAuthenticatorNotifier.notifier).signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "Choose your interests and get the best movie recommendations. Don't worry, you can always change it later.",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                children: interests
                    .map(
                      (interest) => GestureDetector(
                        onTap: () {
                          if (!selectedInterests.contains(interest)) {
                            setState(() {
                              ref
                                  .read(chooseInterestNotifierProvider.notifier)
                                  .addInterest(interest);
                            });
                          } else {
                            setState(() {
                              ref
                                  .read(chooseInterestNotifierProvider.notifier)
                                  .removeInterest(interest);
                            });
                          }
                        },
                        child: Container(
                          child: Text(
                            interest.label,
                            style: TextStyle(
                              color: selectedInterests.contains(interest)
                                  ? AppColors.white
                                  : AppColors.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 24,
                          ),
                          margin: const EdgeInsets.only(right: 8, bottom: 8),
                          decoration: BoxDecoration(
                            color: !selectedInterests.contains(interest)
                                ? AppColors.transparent
                                : AppColors.primary,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              width: 1.3,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList()
                    .animate(interval: 250.ms)
                    .fade(duration: 200.ms)
                    .scale(duration: 200.ms),
              ),
              const SizedBox(height: 16),
              SkipOrContinueButtons(
                onSkipPressed: () {
                  AutoRouter.of(context).push(const FillProfileRoute());
                },
                onContinuePressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
