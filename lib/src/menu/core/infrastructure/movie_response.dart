import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/src/menu/core/infrastructure/movie.dart';

part 'movie_response.freezed.dart';

@freezed
class MovieResponse with _$MovieResponse {
  const MovieResponse._();
  const factory MovieResponse({
    @Default(1) int page,
    @JsonKey(name: 'results') required List<Movie> movies,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'total_results') required int totalResults,
  }) = _MovieResponse;
}
