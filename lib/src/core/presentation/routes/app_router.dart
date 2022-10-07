import 'package:go_router/go_router.dart';
import 'package:movie_app/src/auth/sign_up/presentation/sign_up_screen.dart';
import 'package:movie_app/src/auth/sign_up/presentation/sign_up_with_password_screen.dart';
import 'package:movie_app/src/core/infrastructure/common_import.dart';
import 'package:movie_app/src/movie/presentation/home_screen.dart';
import 'package:movie_app/src/onboarding/presentation/onboarding_screen.dart';
import 'package:movie_app/src/splash/presentation/splash_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/onboarding',
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
    ],
    redirect: (context, state) {
      return null;
    },
    errorBuilder: (_, state) => Scaffold(
      body: Center(
        child: Text(state.error.toString()),
      ),
    ),
  );
}
