// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_login_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyLoginOtpRequest _$VerifyLoginOtpRequestFromJson(
        Map<String, dynamic> json) =>
    VerifyLoginOtpRequest(
      otp: json['otp'] as String?,
      phoneNumber: json['phone_number'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$VerifyLoginOtpRequestToJson(
        VerifyLoginOtpRequest instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'phone_number': instance.phoneNumber,
      'user_id': instance.userId,
    };
