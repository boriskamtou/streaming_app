import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/infrastructure/api/dio_exceptions.dart';
import 'package:movie_app/src/menu/core/infrastructure/movie.dart';
import 'package:movie_app/src/menu/core/infrastructure/movies_extension.dart';
import 'package:movie_app/src/menu/core/infrastructure/network_exception.dart';
import 'package:movie_app/src/menu/core/infrastructure/tmdb_failure.dart';
import 'package:movie_app/src/menu/home/infrastructure/popular_movies_remote_service.dart';

class PopularMoviesRepository {
  final PopularMoviesRemoteService _remoteService;

  PopularMoviesRepository(this._remoteService);

  Future<Either<TMDBFailure, List<Movie>>> getPopularMovies() async {
    try {
      final remotePopularMovies = await _remoteService.getPopularMovies();

      return right(
        await remotePopularMovies.when(
          // error: () async => null,
          data: (data, _) async {
            return data.movies.toDomain();
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(
        TMDBFailure.api(e.message),
      );
    } on DioException catch (e) {
      return left(
        TMDBFailure.api(e.message),
      );
    }
  }
}
