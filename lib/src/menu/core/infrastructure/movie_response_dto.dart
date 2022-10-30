import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/src/menu/core/infrastructure/movie_response.dart';
import 'package:movie_app/src/menu/core/infrastructure/movies_extension.dart';

import 'movie_dto.dart';

part 'movie_response_dto.freezed.dart';
part 'movie_response_dto.g.dart';

@freezed
class MovieResponseDTO with _$MovieResponseDTO {
  const MovieResponseDTO._();
  const factory MovieResponseDTO({
    @Default(1) int page,
    @JsonKey(name: 'results') required List<MovieDTO> movies,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'total_results') required int totalResults,
  }) = _MovieResponseDTO;

  factory MovieResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseDTOFromJson(json);

  factory MovieResponseDTO.fromDomain(MovieResponse _) {
    return MovieResponseDTO(
      page: _.page,
      movies: _.movies.toDTO(),
      totalPages: _.totalPages,
      totalResults: _.totalResults,
    );
  }
}
