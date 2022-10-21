// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../../auth/sign_up/presentation/sign_up_screen.dart' as _i2;
import '../../../auth/sign_up/presentation/sign_up_with_password_screen.dart'
    as _i3;
import '../../../movie/presentation/home_screen.dart' as _i4;
import '../../../onboarding/presentation/onboarding_screen.dart' as _i5;
import '../../../setup_account/choose_your_interest/presentation/choose_your_interest.dart'
    as _i6;
import '../../../splash/presentation/splash_screen.dart' as _i1;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SignUpScreen(),
      );
    },
    SignUpWithPasswordRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SignUpWithPasswordScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.OnboardingScreen(),
      );
    },
    ChooseYourInterestRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.ChooseYourInterestScreen(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          SignUpRoute.name,
          path: '/sign-up',
        ),
        _i7.RouteConfig(
          SignUpWithPasswordRoute.name,
          path: '/sign-up-with-password',
        ),
        _i7.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i7.RouteConfig(
          OnboardingRoute.name,
          path: '/onboarding',
        ),
        _i7.RouteConfig(
          ChooseYourInterestRoute.name,
          path: '/choose-your-interest',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.SignUpScreen]
class SignUpRoute extends _i7.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/sign-up',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i3.SignUpWithPasswordScreen]
class SignUpWithPasswordRoute extends _i7.PageRouteInfo<void> {
  const SignUpWithPasswordRoute()
      : super(
          SignUpWithPasswordRoute.name,
          path: '/sign-up-with-password',
        );

  static const String name = 'SignUpWithPasswordRoute';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.OnboardingScreen]
class OnboardingRoute extends _i7.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: '/onboarding',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i6.ChooseYourInterestScreen]
class ChooseYourInterestRoute extends _i7.PageRouteInfo<void> {
  const ChooseYourInterestRoute()
      : super(
          ChooseYourInterestRoute.name,
          path: '/choose-your-interest',
        );

  static const String name = 'ChooseYourInterestRoute';
}
