// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDomain _$UserDomainFromJson(Map<String, dynamic> json) {
  return _UserDomain.fromJson(json);
}

/// @nodoc
mixin _$UserDomain {
  String get userEmail => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userDisplayName => throw _privateConstructorUsedError;
  String get userPhotoUrl => throw _privateConstructorUsedError;
  String get userPhoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDomainCopyWith<UserDomain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDomainCopyWith<$Res> {
  factory $UserDomainCopyWith(
          UserDomain value, $Res Function(UserDomain) then) =
      _$UserDomainCopyWithImpl<$Res>;
  $Res call(
      {String userEmail,
      String userName,
      String userDisplayName,
      String userPhotoUrl,
      String userPhoneNumber});
}

/// @nodoc
class _$UserDomainCopyWithImpl<$Res> implements $UserDomainCopyWith<$Res> {
  _$UserDomainCopyWithImpl(this._value, this._then);

  final UserDomain _value;
  // ignore: unused_field
  final $Res Function(UserDomain) _then;

  @override
  $Res call({
    Object? userEmail = freezed,
    Object? userName = freezed,
    Object? userDisplayName = freezed,
    Object? userPhotoUrl = freezed,
    Object? userPhoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      userEmail: userEmail == freezed
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userDisplayName: userDisplayName == freezed
          ? _value.userDisplayName
          : userDisplayName // ignore: cast_nullable_to_non_nullable
              as String,
      userPhotoUrl: userPhotoUrl == freezed
          ? _value.userPhotoUrl
          : userPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      userPhoneNumber: userPhoneNumber == freezed
          ? _value.userPhoneNumber
          : userPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserDomainCopyWith<$Res>
    implements $UserDomainCopyWith<$Res> {
  factory _$$_UserDomainCopyWith(
          _$_UserDomain value, $Res Function(_$_UserDomain) then) =
      __$$_UserDomainCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userEmail,
      String userName,
      String userDisplayName,
      String userPhotoUrl,
      String userPhoneNumber});
}

/// @nodoc
class __$$_UserDomainCopyWithImpl<$Res> extends _$UserDomainCopyWithImpl<$Res>
    implements _$$_UserDomainCopyWith<$Res> {
  __$$_UserDomainCopyWithImpl(
      _$_UserDomain _value, $Res Function(_$_UserDomain) _then)
      : super(_value, (v) => _then(v as _$_UserDomain));

  @override
  _$_UserDomain get _value => super._value as _$_UserDomain;

  @override
  $Res call({
    Object? userEmail = freezed,
    Object? userName = freezed,
    Object? userDisplayName = freezed,
    Object? userPhotoUrl = freezed,
    Object? userPhoneNumber = freezed,
  }) {
    return _then(_$_UserDomain(
      userEmail: userEmail == freezed
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userDisplayName: userDisplayName == freezed
          ? _value.userDisplayName
          : userDisplayName // ignore: cast_nullable_to_non_nullable
              as String,
      userPhotoUrl: userPhotoUrl == freezed
          ? _value.userPhotoUrl
          : userPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      userPhoneNumber: userPhoneNumber == freezed
          ? _value.userPhoneNumber
          : userPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDomain extends _UserDomain {
  const _$_UserDomain(
      {required this.userEmail,
      required this.userName,
      required this.userDisplayName,
      required this.userPhotoUrl,
      required this.userPhoneNumber})
      : super._();

  factory _$_UserDomain.fromJson(Map<String, dynamic> json) =>
      _$$_UserDomainFromJson(json);

  @override
  final String userEmail;
  @override
  final String userName;
  @override
  final String userDisplayName;
  @override
  final String userPhotoUrl;
  @override
  final String userPhoneNumber;

  @override
  String toString() {
    return 'UserDomain(userEmail: $userEmail, userName: $userName, userDisplayName: $userDisplayName, userPhotoUrl: $userPhotoUrl, userPhoneNumber: $userPhoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDomain &&
            const DeepCollectionEquality().equals(other.userEmail, userEmail) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality()
                .equals(other.userDisplayName, userDisplayName) &&
            const DeepCollectionEquality()
                .equals(other.userPhotoUrl, userPhotoUrl) &&
            const DeepCollectionEquality()
                .equals(other.userPhoneNumber, userPhoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userEmail),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(userDisplayName),
      const DeepCollectionEquality().hash(userPhotoUrl),
      const DeepCollectionEquality().hash(userPhoneNumber));

  @JsonKey(ignore: true)
  @override
  _$$_UserDomainCopyWith<_$_UserDomain> get copyWith =>
      __$$_UserDomainCopyWithImpl<_$_UserDomain>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDomainToJson(
      this,
    );
  }
}

abstract class _UserDomain extends UserDomain {
  const factory _UserDomain(
      {required final String userEmail,
      required final String userName,
      required final String userDisplayName,
      required final String userPhotoUrl,
      required final String userPhoneNumber}) = _$_UserDomain;
  const _UserDomain._() : super._();

  factory _UserDomain.fromJson(Map<String, dynamic> json) =
      _$_UserDomain.fromJson;

  @override
  String get userEmail;
  @override
  String get userName;
  @override
  String get userDisplayName;
  @override
  String get userPhotoUrl;
  @override
  String get userPhoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$_UserDomainCopyWith<_$_UserDomain> get copyWith =>
      throw _privateConstructorUsedError;
}
