import 'package:go_router/go_router.dart';
import 'package:movie_app/src/auth/sign_up/presentation/sign_up_screen.dart';
import 'package:movie_app/src/auth/sign_up/presentation/sign_up_with_password_screen.dart';
import 'package:movie_app/src/core/infrastructure/common_import.dart';
import 'package:movie_app/src/movie/presentation/home_screen.dart';
import 'package:movie_app/src/onboarding/presentation/onboarding_screen.dart';
import 'package:movie_app/src/setup_account/presentation/choose_your_interest.dart';
import 'package:movie_app/src/splash/presentation/splash_screen.dart';

import '../../application/app_router_notifier.dart';

class AppRouter {
  final AppRouteNotifier _notifier;
  late final router = GoRouter(
    initialLocation: '/onboarding',
    refreshListenable: _notifier,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        name: 'splash_screen',
        builder: (_, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home_screen',
        name: 'home_screen',
        builder: (_, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding_screen',
        builder: (_, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/sign_up',
        name: 'sign_up_screen',
        builder: (_, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/sign_up_with_password',
        name: 'sign_up_with_password_screen',
        builder: (_, state) => const SignUpWithPasswordScreen(),
      ),
      GoRoute(
        path: '/choose-your-interest',
        name: 'choose_your_interest',
        builder: (_, state) => const ChooseYourInterest(),
      ),
    ],
    redirect: _notifier.redirect,
    errorPageBuilder: (_, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    ),
  );

  AppRouter(this._notifier);
}
