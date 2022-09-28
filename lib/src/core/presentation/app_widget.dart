import 'package:flutter/material.dart';
import 'package:movie_app/src/core/presentation/routes/app_router.dart';
import 'package:movie_app/src/core/shared/themes/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _router = AppRouter.router;
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
