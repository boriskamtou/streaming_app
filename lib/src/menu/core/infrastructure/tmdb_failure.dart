import 'package:freezed_annotation/freezed_annotation.dart';
part 'tmdb_failure.freezed.dart';

@freezed
class TMDBFailure with _$TMDBFailure {
  const TMDBFailure._();
  const factory TMDBFailure.api(String? message) = _Api;
}
