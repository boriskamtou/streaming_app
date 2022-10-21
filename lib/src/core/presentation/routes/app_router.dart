import 'package:auto_route/annotations.dart';
import 'package:movie_app/src/auth/sign_up/presentation/sign_up_screen.dart';
import 'package:movie_app/src/auth/sign_up/presentation/sign_up_with_password_screen.dart';
import 'package:movie_app/src/movie/presentation/home_screen.dart';
import 'package:movie_app/src/onboarding/presentation/onboarding_screen.dart';
import 'package:movie_app/src/splash/presentation/splash_screen.dart';

import '../../../setup_account/choose_your_interest/presentation/choose_your_interest.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: SignUpScreen, path: '/sign-up'),
    MaterialRoute(
        page: SignUpWithPasswordScreen, path: '/sign-up-with-password'),
    MaterialRoute(page: HomeScreen, path: '/home'),
    MaterialRoute(page: OnboardingScreen, path: '/onboarding'),
    MaterialRoute(
        page: ChooseYourInterestScreen, path: '/choose-your-interest'),
  ],
  replaceInRouteName: 'Screen,Route',
)
class $AppRouter {}
