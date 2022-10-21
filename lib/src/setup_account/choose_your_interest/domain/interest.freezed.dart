// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'interest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Interest {
  int get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InterestCopyWith<Interest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterestCopyWith<$Res> {
  factory $InterestCopyWith(Interest value, $Res Function(Interest) then) =
      _$InterestCopyWithImpl<$Res>;
  $Res call({int id, String label});
}

/// @nodoc
class _$InterestCopyWithImpl<$Res> implements $InterestCopyWith<$Res> {
  _$InterestCopyWithImpl(this._value, this._then);

  final Interest _value;
  // ignore: unused_field
  final $Res Function(Interest) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_InterestCopyWith<$Res> implements $InterestCopyWith<$Res> {
  factory _$$_InterestCopyWith(
          _$_Interest value, $Res Function(_$_Interest) then) =
      __$$_InterestCopyWithImpl<$Res>;
  @override
  $Res call({int id, String label});
}

/// @nodoc
class __$$_InterestCopyWithImpl<$Res> extends _$InterestCopyWithImpl<$Res>
    implements _$$_InterestCopyWith<$Res> {
  __$$_InterestCopyWithImpl(
      _$_Interest _value, $Res Function(_$_Interest) _then)
      : super(_value, (v) => _then(v as _$_Interest));

  @override
  _$_Interest get _value => super._value as _$_Interest;

  @override
  $Res call({
    Object? id = freezed,
    Object? label = freezed,
  }) {
    return _then(_$_Interest(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Interest extends _Interest {
  const _$_Interest({required this.id, required this.label}) : super._();

  @override
  final int id;
  @override
  final String label;

  @override
  String toString() {
    return 'Interest(id: $id, label: $label)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Interest &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.label, label));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(label));

  @JsonKey(ignore: true)
  @override
  _$$_InterestCopyWith<_$_Interest> get copyWith =>
      __$$_InterestCopyWithImpl<_$_Interest>(this, _$identity);
}

abstract class _Interest extends Interest {
  const factory _Interest(
      {required final int id, required final String label}) = _$_Interest;
  const _Interest._() : super._();

  @override
  int get id;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$_InterestCopyWith<_$_Interest> get copyWith =>
      throw _privateConstructorUsedError;
}
