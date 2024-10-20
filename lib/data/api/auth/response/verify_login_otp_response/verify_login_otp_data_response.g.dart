// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_login_otp_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyLoginOtpDataResponse _$VerifyLoginOtpDataResponseFromJson(
        Map<String, dynamic> json) =>
    VerifyLoginOtpDataResponse(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyLoginOtpDataResponseToJson(
        VerifyLoginOtpDataResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'user': instance.user,
    };
