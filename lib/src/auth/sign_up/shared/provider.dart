import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app/src/auth/sign_up/application/firebase_authenticator_notifier.dart';
import 'package:movie_app/src/auth/sign_up/infrastructure/credentials_storage/secure_credentials_storage.dart';
import 'package:movie_app/src/auth/sign_up/infrastructure/firebase_authenticator.dart';

import '../../../core/shared/providers.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final secureCredentialsStorage = Provider<SecureCredentialsStorage>((ref) {
  return SecureCredentialsStorage(ref.watch(flutterSecureStorageProvider));
});

final firebaseAuthenticatorProvider = Provider<FirebaseAuthenticator>((ref) {
  return FirebaseAuthenticator(
    ref.watch(firebaseAuthProvider),
    ref.watch(secureCredentialsStorage),
    ref.watch(sharedPrefProvider),
  );
});

final firebaseAuthenticatorNotifier =
    StateNotifierProvider<FirebaseAuthenticatorNotifier, AuthState>((ref) {
  return FirebaseAuthenticatorNotifier(
      ref.watch(firebaseAuthenticatorProvider));
});

final flutterSecureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});
