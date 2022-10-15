import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../auth/sign_up/application/firebase_authenticator_notifier.dart';
import '../../auth/sign_up/shared/provider.dart';

class AppRouteNotifier extends ChangeNotifier {
  final Ref _ref;

  AppRouteNotifier(this._ref) {
    _ref.listen<AuthState>(
      firebaseAuthenticatorNotifier,
      (previous, next) => notifyListeners(),
    );
  }

  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    final authState = _ref.read(firebaseAuthenticatorNotifier);

    final _isSigned = authState == const AuthState.authenticated();

    final isInSignUpScreen = state.subloc == '/sign_up_with_password';

    if (_isSigned) return isInSignUpScreen ? '/choose-your-interest' : null;

    if (!_isSigned) {
      return state.subloc == '/choose-your-interest'
          ? '/sign_up_with_password'
          : null;
    }
    return null;
  }
}
