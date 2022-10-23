import '../../../core/infrastructure/common_import.dart';
import '../../core/shared/widgets/skip_or_continue_buttons.dart';

class SetFingerprintScreen extends ConsumerWidget {
  const SetFingerprintScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Your Fingerprint'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Add a fingerprint to make your account\nmore secure.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Image.asset(
                    'assets/images/fingerprint.png',
                    width: 100,
                  ),
                  Text(
                    'Please put your finger on the fingerprint\nscanner to get started.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            SkipOrContinueButtons(
              onSkipPressed: () {},
              onContinuePressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
