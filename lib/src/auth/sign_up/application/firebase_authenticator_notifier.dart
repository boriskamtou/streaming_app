import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/src/auth/sign_up/domain/auth_failure.dart';
import 'package:movie_app/src/auth/sign_up/infrastructure/firebase_authenticator.dart';
import 'package:movie_app/src/core/infrastructure/common_import.dart';

part 'firebase_authenticator_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.intiial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.failure(AuthFailure authFailure) = _Failure;
}

class FirebaseAuthenticatorNotifier extends StateNotifier<AuthState> {
  final FirebaseAuthenticator _signUpAuthenticator;

  FirebaseAuthenticatorNotifier(this._signUpAuthenticator)
      : super(const AuthState.intiial());

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    state = const AuthState.loading();
    final failureOrSuccess =
        await _signUpAuthenticator.signUpWithEmailAndPassword(email, password);
    state = failureOrSuccess.fold(
      (l) => AuthState.failure(l),
      (r) => const AuthState.authenticated(),
    );
  }

  Future<void> signUpWithGoogle() async {
    state = const AuthState.loading();
    final failureOrSuccess = await _signUpAuthenticator.signUpWithGoogle();
    state = failureOrSuccess.fold(
      (l) => AuthState.failure(l),
      (r) => const AuthState.authenticated(),
    );
  }

  Future<void> signOut() async {
    final failureOrSuccess = await _signUpAuthenticator.signOut();
    state = failureOrSuccess.fold(
      (l) => AuthState.failure(l),
      (r) => const AuthState.unauthenticated(),
    );
  }

  Future<bool> isSigned() async {
    final value = await _signUpAuthenticator.isSigned();
    return value;
  }

  Future<void> checkAuthStatus() async {
    state = await (_signUpAuthenticator.isSigned())
        ? const AuthState.authenticated()
        : const AuthState.unauthenticated();
  }

  Future<void> getIsRememberMeStatus() =>
      _signUpAuthenticator.getIsRememberMeStatus();

  bool get getIsRememberMe => _signUpAuthenticator.getIsRememberMe;

  void toggleRemeberMe() {
    _signUpAuthenticator.toggleRememberMe();
  }
}
