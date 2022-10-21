import 'package:movie_app/src/core/infrastructure/common_import.dart';
import 'package:movie_app/src/setup_account/choose_your_interest/domain/interest.dart';
import 'package:movie_app/src/setup_account/choose_your_interest/infrastructure/choose_interest.dart';

class ChooseInterestNotifier extends StateNotifier<List<Interest>> {
  final ChooseInterest _chooseInterest;

  ChooseInterestNotifier(this._chooseInterest) : super(const []);

  List<Interest> get listOfInterets => _chooseInterest.interests;
  List<Interest> get listOfSeletedInterets => state;

  void addInterest(Interest interest) {
    state = [...state, interest];
  }

  void removeInterest(Interest interest) {
    state = state.where((_) => _.id != interest.id).toList();
  }
}
