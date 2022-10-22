import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:movie_app/src/core/infrastructure/validation_service.dart';
import 'package:movie_app/src/core/presentation/routes/app_router.gr.dart';
import 'package:movie_app/src/core/shared/widgets/common_textformfield.dart';
import 'package:movie_app/src/setup_account/fill_your_profile/application/fill_profile_notifier.dart';
import 'package:movie_app/src/setup_account/fill_your_profile/shared/providers.dart';

import '../../../core/infrastructure/common_import.dart';
import '../../core/shared/widgets/skip_or_continue_buttons.dart';
import 'widgets/user_image_picker.dart';

class FillProfileScreen extends StatefulHookConsumerWidget {
  const FillProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FillProfileScreenState();
}

class _FillProfileScreenState extends ConsumerState<FillProfileScreen> {
  final _formkey = GlobalKey<FormState>();
  File? _image;
  String _genderValue = 'Male';

  final _genderList = [
    'Male',
    'Female',
  ];

  @override
  Widget build(BuildContext context) {
    final _userNameController = useTextEditingController();
    final _nicknameController = useTextEditingController();
    final _emailController = useTextEditingController();
    final _phoneController = useTextEditingController();
    ref.listen<FillProfileState>(
      fillProfileNotifier,
      (previous, next) {
        next.maybeWhen(
          orElse: () {},
          failure: (message) {
            Flushbar(
              message: message,
              icon: const Icon(
                Icons.info,
                color: AppColors.alertError,
              ),
              borderRadius: BorderRadius.circular(10),
              backgroundColor: AppColors.bgRed,
              messageColor: AppColors.alertError,
              duration: const Duration(seconds: 2),
              margin: const EdgeInsets.all(16),
            ).show(context);
          },
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fill Your Profile'),
      ),
      body: ProgressHUD(
        barrierEnabled: true,
        child: Builder(builder: (ctx) {
          return SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    UserImagePicker(
                      onPickImagePressed: (imageFile) {
                        setState(() {
                          _image = imageFile;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    CommonTextFormField(
                      hintText: 'Full Name',
                      controller: _userNameController,
                      validator: ValidationService.validateFullNaMe,
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(height: 15),
                    CommonTextFormField(
                      hintText: 'Nickname',
                      controller: _nicknameController,
                      validator: ValidationService.validateNickName,
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(height: 15),
                    CommonTextFormField(
                      hintText: 'Email',
                      controller: _emailController,
                      validator: ValidationService.validateEmail,
                      suffixIcon: Image.asset('assets/icons/user_email.png'),
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15),
                    CommonTextFormField(
                      hintText: 'Phone Number',
                      controller: _phoneController,
                      validator: ValidationService.validatePhoneNumber,
                      textInputType: TextInputType.phone,
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAFAFA),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButton(
                        value: _genderValue,
                        borderRadius: BorderRadius.circular(12),
                        dropdownColor: const Color(0xFFFAFAFA),
                        isExpanded: true,
                        hint: Text(
                          'Gender',
                          style:
                              Theme.of(context).inputDecorationTheme.hintStyle,
                        ),
                        icon: Image.asset('assets/icons/arrow_down.png'),
                        underline: const SizedBox.shrink(),
                        items: _genderList.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: GoogleFonts.urbanist(
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .2,
                                fontSize: 14,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _genderValue = newValue!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    SkipOrContinueButtons(
                      onSkipPressed: () {
                        AutoRouter.of(context).push(const CreatePinRoute());
                      },
                      onContinuePressed: () {
                        FocusScope.of(context).unfocus();
                        if (_image == null) {
                          Flushbar(
                            message: 'Please provide an image',
                            icon: const Icon(
                              Icons.info,
                              color: AppColors.alertError,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            backgroundColor: AppColors.bgRed,
                            messageColor: AppColors.alertError,
                            duration: const Duration(seconds: 2),
                            margin: const EdgeInsets.all(16),
                          ).show(context);
                        } else {
                          if (_formkey.currentState!.validate()) {
                            final progress = ProgressHUD.of(ctx);

                            progress?.show();
                            ref
                                .read(fillProfileNotifier.notifier)
                                .createProfile(
                                  _image!,
                                  _userNameController.text,
                                  _nicknameController.text,
                                  _emailController.text,
                                  _phoneController.text,
                                  _genderValue,
                                )
                                .then((_) => progress?.dismiss());
                          }
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
