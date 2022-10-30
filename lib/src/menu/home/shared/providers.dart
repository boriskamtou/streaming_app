import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app/src/core/shared/providers.dart';
import 'package:movie_app/src/menu/home/application/popular_movies_notifier.dart';
import 'package:movie_app/src/menu/home/infrastructure/popular_movies_remote_service.dart';
import 'package:movie_app/src/menu/home/infrastructure/popular_movies_repository.dart';

final popularMoviesRemoteServiceProvider =
    Provider<PopularMoviesRemoteService>((ref) {
  return PopularMoviesRemoteService(ref.watch(dioProvider));
});

final popularMoviesRepositoryProvider = Provider<PopularMoviesRepository>(
  (ref) {
    return PopularMoviesRepository(
        ref.watch(popularMoviesRemoteServiceProvider));
  },
);

final popularMoviesNotifier =
    StateNotifierProvider<PopularMoviesNotifier, PopularMoviesState>((ref) {
  return PopularMoviesNotifier(ref.watch(popularMoviesRepositoryProvider));
});
