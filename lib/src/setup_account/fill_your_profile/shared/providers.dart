import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app/src/setup_account/choose_your_interest/shared/providers.dart';
import 'package:movie_app/src/setup_account/fill_your_profile/application/fill_profile_notifier.dart';
import 'package:movie_app/src/setup_account/fill_your_profile/infrastructure/fill_profile.dart';

final firebaseStorageProvider = Provider((ref) {
  return FirebaseStorage.instance;
});

final fillProfileProvider = Provider((ref) {
  return FillProfile(
    ref.watch(firestoreProvider),
    ref.watch(firebaseStorageProvider),
  );
});

final fillProfileNotifier =
    StateNotifierProvider<FillProfileNotifier, FillProfileState>((ref) {
  return FillProfileNotifier(
    ref.watch(fillProfileProvider),
  );
});
