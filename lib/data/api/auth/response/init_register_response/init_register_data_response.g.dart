// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_register_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitRegisterDataResponse _$InitRegisterDataResponseFromJson(
        Map<String, dynamic> json) =>
    InitRegisterDataResponse(
      isActivated: json['is_activated'] as bool?,
      isVerified: json['is_verified'] as bool?,
      phoneNumber: json['phone_number'] as String?,
    );

Map<String, dynamic> _$InitRegisterDataResponseToJson(
        InitRegisterDataResponse instance) =>
    <String, dynamic>{
      'is_activated': instance.isActivated,
      'is_verified': instance.isVerified,
      'phone_number': instance.phoneNumber,
    };
