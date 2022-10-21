import 'package:freezed_annotation/freezed_annotation.dart';

part 'interest.freezed.dart';

@freezed
class Interest with _$Interest {
  const Interest._();
  const factory Interest({
    required int id,
    required String label,
  }) = _Interest;
}
