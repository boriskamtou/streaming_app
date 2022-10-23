import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_app/src/core/presentation/routes/app_router.gr.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/infrastructure/common_import.dart';
import '../../core/shared/widgets/skip_or_continue_buttons.dart';

class CreatePinScreen extends StatefulHookConsumerWidget {
  const CreatePinScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreatePinScreenState();
}

class _CreatePinScreenState extends ConsumerState<CreatePinScreen> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _pinController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New PIN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add a PIN number to make your account\nmore secure.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: PinCodeTextField(
                  controller: _pinController,
                  appContext: context,
                  length: 4,
                  obscureText: true,
                  obscuringCharacter: '⚫',
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  enableActiveFill: true,
                  backgroundColor: AppColors.transparent,
                  cursorColor: AppColors.primary,
                  cursorHeight: 20,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderWidth: .75,
                    selectedFillColor: AppColors.bgRed,
                    selectedColor: AppColors.primary,
                    activeColor: AppColors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    fieldHeight: 50,
                    fieldWidth: 61,
                    inactiveColor: AppColors.transparent,
                    activeFillColor: AppColors.transparent,
                    inactiveFillColor: AppColors.bgWhite,
                  ),
                  pastedTextStyle: GoogleFonts.urbanist(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .2,
                    fontSize: 14,
                  ),
                  onChanged: (v) {},
                ),
              ),
              const Spacer(),
              SkipOrContinueButtons(
                onSkipPressed: () {
                  AutoRouter.of(context).push(const SetFingerprintRoute());
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
