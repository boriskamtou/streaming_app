import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app/src/auth/sign_up/shared/provider.dart';
import 'package:movie_app/src/core/shared/providers.dart';
import 'package:movie_app/src/core/shared/themes/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

final intitializationProvider = FutureProvider<Unit>((ref) async {
  await SharedPreferences.getInstance();
  final _authNotifier = ref.watch(firebaseAuthenticatorNotifier.notifier);
  await _authNotifier.checkAuthStatus();
  return unit;
});

class AppWidget extends ConsumerWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      intitializationProvider,
      (previous, next) {},
    );
    final _router = ref.read(appRouterProvider).router;
    final theme = AppTheme.lightTheme();
    return MaterialApp.router(
      theme: theme,
      title: 'Mova',
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
      backButtonDispatcher: _router.backButtonDispatcher,
    );
  }
}
