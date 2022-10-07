import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app/src/auth/sign_up/application/sign_up_authenticator_notifier.dart';
import 'package:movie_app/src/auth/sign_up/infrastructure/sign_up_authenticator.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) {
    return FirebaseAuth.instance;
  },
);

final signUpAuthenticatorProvider = Provider<SignUpAuthenticator>(
  (ref) {
    return SignUpAuthenticator(ref.watch(firebaseAuthProvider));
  },
);

final signUpAuthenticatorNotifier =
    StateNotifierProvider<SignUpAuthenticatorNotifier, AuthState>(
  (ref) {
    return SignUpAuthenticatorNotifier(ref.watch(signUpAuthenticatorProvider));
  },
);
