import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app/src/setup_account/choose_your_interest/application/choose_interest_notifier.dart';
import 'package:movie_app/src/setup_account/choose_your_interest/domain/interest.dart';
import 'package:movie_app/src/setup_account/choose_your_interest/infrastructure/choose_interest.dart';

final chooseInterestProvider = Provider<ChooseInterest>((ref) {
  return ChooseInterest();
});

final chooseInterestNotifierProvider =
    StateNotifierProvider<ChooseInterestNotifier, List<Interest>>((ref) {
  return ChooseInterestNotifier(ref.watch(chooseInterestProvider));
});
