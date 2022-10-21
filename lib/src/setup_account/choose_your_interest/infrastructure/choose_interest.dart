import 'package:movie_app/src/setup_account/choose_your_interest/domain/interest.dart';

class ChooseInterest {
  final _listOfInterest = [
    const Interest(id: 1, label: 'Action'),
    const Interest(id: 2, label: 'Drama'),
    const Interest(id: 3, label: 'Comedy'),
    const Interest(id: 4, label: 'Horror'),
    const Interest(id: 5, label: 'Adventure'),
    const Interest(id: 6, label: 'Thriller'),
    const Interest(id: 7, label: 'Romance'),
    const Interest(id: 8, label: 'Science'),
    const Interest(id: 9, label: 'Music'),
    const Interest(id: 10, label: 'Documentary'),
    const Interest(id: 11, label: 'Crime'),
    const Interest(id: 12, label: 'Fantasy'),
    const Interest(id: 13, label: 'Mystery'),
    const Interest(id: 14, label: 'Fiction'),
    const Interest(id: 15, label: 'Animation'),
    const Interest(id: 16, label: 'War'),
    const Interest(id: 17, label: 'History'),
    const Interest(id: 18, label: 'Television'),
    const Interest(id: 19, label: 'Superheroes'),
    const Interest(id: 20, label: 'Anime'),
    const Interest(id: 21, label: 'Sports'),
    const Interest(id: 22, label: 'K-Drama'),
  ];

  List<Interest> get interests => [..._listOfInterest];
}
