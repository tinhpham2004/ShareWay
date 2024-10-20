// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_oauth_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginOauthDataResponse _$LoginOauthDataResponseFromJson(
        Map<String, dynamic> json) =>
    LoginOauthDataResponse(
      fullName: json['full_name'] as String?,
      isActivated: json['is_activated'] as bool?,
      isVerified: json['is_verified'] as bool?,
      phoneNumber: json['phone_number'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$LoginOauthDataResponseToJson(
        LoginOauthDataResponse instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'is_activated': instance.isActivated,
      'is_verified': instance.isVerified,
      'phone_number': instance.phoneNumber,
      'user_id': instance.userId,
    };
