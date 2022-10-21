import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/src/core/infrastructure/common_import.dart';
import 'package:movie_app/src/setup_account/choose_your_interest/domain/interest.dart';
import 'package:movie_app/src/setup_account/choose_your_interest/infrastructure/choose_interest.dart';

class ChooseInterestNotifier extends StateNotifier<List<Interest>> {
  final ChooseInterest _chooseInterest;
  final FirebaseFirestore _firebaseFirestore;

  ChooseInterestNotifier(this._chooseInterest, this._firebaseFirestore)
      : super(const []);

  List<Interest> get listOfInterets => _chooseInterest.interests;
  List<Interest> get listOfSeletedInterets => state;

  void addInterest(Interest interest) {
    // final interestsCollection = _firebaseFirestore.collection("interests");
    // interestsCollection.add({
    //   "id": interest.id,
    //   "label": interest.label,
    // });
    state = [...state, interest];
  }

  void removeInterest(Interest interest) {
    // final interestsCollection = _firebaseFirestore.collection("interests");
    // interestsCollection.doc(interest.label).delete();
    state = state.where((_) => _.id != interest.id).toList();
  }
}
