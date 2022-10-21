import '../../../../core/infrastructure/common_import.dart';

class SkipOrContinueButtons extends StatelessWidget {
  final Function()? onSkipPressed;
  final Function()? onContinuePressed;
  const SkipOrContinueButtons({
    Key? key,
    required this.onSkipPressed,
    required this.onContinuePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: onSkipPressed,
            child: const Text('Skip'),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: ElevatedButton(
            onPressed: onContinuePressed,
            child: const Text('Continue'),
          ),
        )
      ],
    );
  }
}
