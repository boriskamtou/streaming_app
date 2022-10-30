import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/src/core/infrastructure/common_import.dart';
import 'package:movie_app/src/menu/home/infrastructure/popular_movies_repository.dart';

import '../../core/infrastructure/movie.dart';

part 'popular_movies_notifier.freezed.dart';

@freezed
class PopularMoviesState with _$PopularMoviesState {
  const PopularMoviesState._();
  const factory PopularMoviesState.intial() = _Initial;
  const factory PopularMoviesState.loading() = _Loading;
  const factory PopularMoviesState.failure(String? message) = _Failure;
  const factory PopularMoviesState.success(List<Movie> movies) = _Success;
}

class PopularMoviesNotifier extends StateNotifier<PopularMoviesState> {
  final PopularMoviesRepository _repository;

  PopularMoviesNotifier(this._repository)
      : super(const PopularMoviesState.intial());

  Future<void> getPopularMovies() async {
    state = const PopularMoviesState.loading();
    final failureOrSuccess = await _repository.getPopularMovies();
    state = failureOrSuccess.fold(
      (l) {
        return PopularMoviesState.failure(l.message);
      },
      (r) => PopularMoviesState.success(r),
    );
  }
}
