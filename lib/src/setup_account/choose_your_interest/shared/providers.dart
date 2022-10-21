import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app/src/setup_account/choose_your_interest/application/choose_interest_notifier.dart';
import 'package:movie_app/src/setup_account/choose_your_interest/domain/interest.dart';
import 'package:movie_app/src/setup_account/choose_your_interest/infrastructure/choose_interest.dart';

final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final chooseInterestProvider = Provider<ChooseInterest>((ref) {
  return ChooseInterest();
});

final chooseInterestNotifierProvider =
    StateNotifierProvider<ChooseInterestNotifier, List<Interest>>((ref) {
  return ChooseInterestNotifier(
    ref.watch(chooseInterestProvider),
    ref.watch(firestoreProvider),
  );
});
