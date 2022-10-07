import 'package:go_router/go_router.dart';

import '../../../core/infrastructure/common_import.dart';
import '../shared/provider.dart';

class SignUpWithPasswordScreen extends ConsumerStatefulWidget {
  const SignUpWithPasswordScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignUpWithPasswordScreenState();
}

class _SignUpWithPasswordScreenState
    extends ConsumerState<SignUpWithPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (v) {},
                            ),
                            const SizedBox(width: 2),
                            Text(
                              'Remember me',
                              style: Theme.of(context).textTheme.bodyText1,
                            )
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.go('/sign_up_with_password');
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
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Or continue with',
                              style: Theme.of(context).textTheme.titleSmall,
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
                                .read(signUpAuthenticatorNotifier.notifier)
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
            ),
          ],
        ),
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
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 26),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color(0xFFEEEEEE),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Image.asset(imageUrl),
      ),
    );
  }
}
