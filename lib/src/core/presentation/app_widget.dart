import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app/src/auth/sign_up/shared/provider.dart';
import 'package:movie_app/src/core/presentation/routes/app_router.gr.dart';
import 'package:movie_app/src/core/shared/constants/storage_constants.dart';
import 'package:movie_app/src/core/shared/themes/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/sign_up/application/firebase_authenticator_notifier.dart';
import '../shared/providers.dart';

final intitializationProvider = FutureProvider<Unit>((ref) async {
  await SharedPreferences.getInstance();
  final _authNotifier = ref.watch(firebaseAuthenticatorNotifier.notifier);
  _authNotifier.checkAuthStatus();
  return unit;
});

final _appRouter = AppRouter();

class AppWidget extends ConsumerWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      intitializationProvider,
      (previous, next) {},
    );
    ref.listen<AuthState>(
      firebaseAuthenticatorNotifier,
      (previous, state) {
        state.maybeMap(
          orElse: () {},
          authenticated: (_) {
            _appRouter.pushAndPopUntil(const ChooseYourInterestRoute(),
                predicate: (route) => false);
          },
          unauthenticated: (_) {
            final _hasSeen = ref
                    .watch(sharedPrefProvider)
                    .getBool(StorageConstants.hasSeenOnboarding) ??
                false;

            if (_hasSeen) {
              _appRouter.pushAndPopUntil(const SignUpWithPasswordRoute(),
                  predicate: (route) => false);
            } else {
              _appRouter.pushAndPopUntil(const OnboardingRoute(),
                  predicate: (route) => false);
            }
          },
        );
      },
    );
    final theme = AppTheme.lightTheme();
    return MaterialApp.router(
      theme: theme,
      title: 'Mova',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
