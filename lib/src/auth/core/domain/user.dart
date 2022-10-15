import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class UserDomain with _$UserDomain {
  const UserDomain._();
  const factory UserDomain({
    required String userEmail,
    required String userName,
    required String userDisplayName,
    required String userPhotoUrl,
    required String userPhoneNumber,
  }) = _UserDomain;

  factory UserDomain.fromJson(Map<String, dynamic> json) =>
      _$UserDomainFromJson(json);
}
