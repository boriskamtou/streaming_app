import 'package:movie_app/src/auth/sign_up/shared/provider.dart';
import 'package:movie_app/src/core/infrastructure/common_import.dart';

class ChooseYourInterest extends ConsumerWidget {
  const ChooseYourInterest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: IconButton(
            onPressed: () {
              ref.read(firebaseAuthenticatorNotifier.notifier).signOut();
            },
            icon: const Icon(Icons.logout)),
      ),
    );
  }
}
