// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_phone_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginPhoneDataResponse _$LoginPhoneDataResponseFromJson(
        Map<String, dynamic> json) =>
    LoginPhoneDataResponse(
      isActivated: json['is_activated'] as bool?,
      isVerified: json['is_verified'] as bool?,
      phoneNumber: json['phone_number'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$LoginPhoneDataResponseToJson(
        LoginPhoneDataResponse instance) =>
    <String, dynamic>{
      'is_activated': instance.isActivated,
      'is_verified': instance.isVerified,
      'phone_number': instance.phoneNumber,
      'user_id': instance.userId,
    };
