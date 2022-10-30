// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiError _$$_ApiErrorFromJson(Map<String, dynamic> json) => _$_ApiError(
      statusCode: json['status_code'] as int,
      message: json['status_message'] as String,
      isSuccess: json['success'] as bool,
    );

Map<String, dynamic> _$$_ApiErrorToJson(_$_ApiError instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.message,
      'success': instance.isSuccess,
    };
