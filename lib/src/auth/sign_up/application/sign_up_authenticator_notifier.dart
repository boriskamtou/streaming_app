import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/src/auth/sign_up/domain/auth_failure.dart';
import 'package:movie_app/src/auth/sign_up/infrastructure/sign_up_authenticator.dart';
import 'package:movie_app/src/core/infrastructure/common_import.dart';

part 'sign_up_authenticator_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.intiial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(UserCredential userCredential) =
      _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.failure(AuthFailure authFailure) = _Failure;
}

class SignUpAuthenticatorNotifier extends StateNotifier<AuthState> {
  final SignUpAuthenticator _signUpAuthenticator;

  SignUpAuthenticatorNotifier(this._signUpAuthenticator)
      : super(const AuthState.intiial());

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    state = const AuthState.loading();
    final failureOrSuccess =
        await _signUpAuthenticator.signUpWithEmailAndPassword(email, password);
    state = failureOrSuccess.fold(
      (l) => AuthState.failure(l),
      (r) => AuthState.authenticated(r),
    );
  }

  Future<void> signUpWithGoogle() async {
    state = const AuthState.loading();
    final failureOrSuccess = await _signUpAuthenticator.signUpWithGoogle();
    state = failureOrSuccess.fold(
      (l) => AuthState.failure(l),
      (r) => AuthState.authenticated(r),
    );
  }

  Future<void> signOut() async {
    final failureOrSuccess = await _signUpAuthenticator.signOut();
    state = failureOrSuccess.fold(
      (l) => AuthState.failure(l),
      (r) => const AuthState.unauthenticated(),
    );
  }
}
