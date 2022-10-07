import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/src/auth/sign_up/domain/auth_failure.dart';

class SignUpAuthenticator {
  final FirebaseAuth _auth;

  SignUpAuthenticator(this._auth);

  Future<Either<AuthFailure, UserCredential>> signUpWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredentials;

    try {
      userCredentials = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(userCredentials);
    } on PlatformException catch (e) {
      String message = 'An error occured. Please check your credentials.';

      if (e.message != null) {
        message = e.message!;
      }
      return left(AuthFailure.failure(message));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(
          const AuthFailure.failure('The password provided is too weak.'),
        );
      } else if (e.code == 'email-already-in-use') {
        return left(
          const AuthFailure.failure(
              'The account already exists for that email.'),
        );
      } else if (e.code == 'invalid-email') {
        return left(
          const AuthFailure.failure('The email address is not valid.'),
        );
      } else {
        return left(
          AuthFailure.failure('Failed with error code: ${e.code}'),
        );
      }
    }
  }

  Future<Either<AuthFailure, UserCredential>> signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUserAccount =
          await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUserAccount?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return right(
          await FirebaseAuth.instance.signInWithCredential(credential));
    } on PlatformException catch (e) {
      return left(
        AuthFailure.failure(e.message),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(
          const AuthFailure.failure('The password provided is too weak.'),
        );
      } else if (e.code == 'email-already-in-use') {
        return left(
          const AuthFailure.failure(
              'The account already exists for that email.'),
        );
      } else {
        return left(
          AuthFailure.failure('Failed with error code: ${e.code}'),
        );
      }
    }
  }

  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      await _auth.signOut();
      return right(unit);
    } on PlatformException catch (e) {
      return left(AuthFailure.failure(e.message));
    }
  }
}
