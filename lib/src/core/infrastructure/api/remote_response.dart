import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_response.freezed.dart';

@freezed
class RemoteResponse<T> with _$RemoteResponse<T> {
  const RemoteResponse._();
  // const factory RemoteResponse.error() = _Error<T>;
  const factory RemoteResponse.data(T data, {required int maxPage}) = _Data<T>;
}
