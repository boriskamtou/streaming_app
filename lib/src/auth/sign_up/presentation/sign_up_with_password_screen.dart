import 'package:another_flushbar/flushbar.dart';
import 'package:movie_app/src/auth/sign_up/application/firebase_authenticator_notifier.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:movie_app/src/auth/sign_up/infrastructure/sign_up_validation.dart';
import 'package:movie_app/src/core/shared/constants/storage_constants.dart';
import '../../../core/infrastructure/common_import.dart';
import '../../../core/shared/widgets/common_textformfield.dart';
import '../shared/provider.dart';

class SignUpWithPasswordScreen extends ConsumerStatefulWidget {
  const SignUpWithPasswordScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignUpWithPasswordScreenState();
}

class _SignUpWithPasswordScreenState
    extends ConsumerState<SignUpWithPasswordScreen> {
  final _focusNode = FocusNode();
  final bool _hasFocus = false;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _showPassword = false;

  void initValue() async {
    final _auth = ref.read(firebaseAuthenticatorNotifier.notifier);
    final _localStorage = ref.read(secureCredentialsStorage);
    if (_auth.getIsRememberMe) {
      final _email =
          await _localStorage.getCredentials(StorageConstants.userEmail);
      if (_email != null) {
        _emailController.text = _email;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    initValue();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(firebaseAuthenticatorNotifier, (previous, next) {
      next.maybeWhen(
        orElse: () {},
        loading: () {},
        authenticated: () {
          Flushbar(
            message: 'Success',
            icon: const Icon(
              Icons.info,
              color: AppColors.alertSuccess,
            ),
            borderRadius: BorderRadius.circular(10),
            backgroundColor: AppColors.bgGreen,
            messageColor: AppColors.alertSuccess,
            margin: const EdgeInsets.all(16),
            duration: const Duration(seconds: 2),
          ).show(context);
        },
        failure: (authFailure) {
          authFailure.maybeMap(
            orElse: () {},
            failure: (value) {
              Flushbar(
                message: value.message,
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
    });
    return Scaffold(
      body: ProgressHUD(
        barrierEnabled: true,
        child: Builder(builder: (ctx) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        splashRadius: 20,
                        icon: Image.asset('assets/icons/arrow.png'),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: 50,
                  height: 50,
                ),
                const SizedBox(height: 20),
                Text(
                  'Create your account',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(height: 20),
                Consumer(
                  builder: (context, ref, _) {
                    final _authNotifier =
                        ref.watch(firebaseAuthenticatorNotifier.notifier);
                    return Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CommonTextFormField(
                              controller: _emailController,
                              hasFocus: _hasFocus,
                              focusNode: _focusNode,
                              prefixIcon:
                                  Image.asset('assets/icons/message.png'),
                              validator: SignUpValidation.validateEmail,
                              hintText: 'Email',
                            ),
                            const SizedBox(height: 20),
                            CommonTextFormField(
                              controller: _passwordController,
                              hasFocus: _hasFocus,
                              validator: SignUpValidation.validatePassword,
                              obscureText: _showPassword,
                              prefixIcon: Image.asset('assets/icons/lock.png'),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                                borderRadius: BorderRadius.circular(8),
                                child:
                                    Image.asset('assets/icons/hide_close.png'),
                              ),
                              hintText: 'Password',
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    value: _authNotifier.getIsRememberMe,
                                    onChanged: (v) {
                                      setState(() {
                                        _authNotifier.toggleRemeberMe(v!);
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    'Remember me',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                // context.go('/sign_up_with_password');*
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState!.validate()) {
                                  final progress = ProgressHUD.of(ctx);

                                  progress?.show();
                                  ref
                                      .read(firebaseAuthenticatorNotifier
                                          .notifier)
                                      .signUpWithEmailAndPassword(
                                        _emailController.text,
                                        _passwordController.text,
                                      )
                                      .then((_) => progress?.dismiss());
                                }
                              },
                              child: const Text('Sign up'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Divider(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Text(
                                      'Or continue with',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ),
                                  const Divider(),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _SocialIconSignUp(
                                  onTap: () {},
                                  imageUrl: 'assets/icons/facebook.png',
                                ),
                                _SocialIconSignUp(
                                  onTap: () {
                                    ref
                                        .read(firebaseAuthenticatorNotifier
                                            .notifier)
                                        .signUpWithGoogle();
                                  },
                                  imageUrl: 'assets/icons/google.png',
                                ),
                                _SocialIconSignUp(
                                  onTap: () {},
                                  imageUrl: 'assets/icons/apple-dark.png',
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Already have an account?'),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('Sign In'),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _SocialIconSignUp extends StatelessWidget {
  final void Function() onTap;
  final String imageUrl;
  const _SocialIconSignUp({
    Key? key,
    required this.onTap,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color(0xFFEEEEEE),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: IconButton(
          onPressed: () {},
          splashColor: Colors.transparent,
          padding: EdgeInsets.zero,
          icon: Image.asset(imageUrl),
        ),
      ),
    );
  }
}
