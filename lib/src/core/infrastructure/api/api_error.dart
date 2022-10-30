import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';
part 'api_error.g.dart';

@freezed
class ApiError with _$ApiError {
  const ApiError._();
  const factory ApiError({
    @JsonKey(name: 'status_code') required int statusCode,
    @JsonKey(name: 'status_message') required String message,
    @JsonKey(name: 'success') required bool isSuccess,
  }) = _ApiError;

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);
}
