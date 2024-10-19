// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_register_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyRegisterOtpRequest _$VerifyRegisterOtpRequestFromJson(
        Map<String, dynamic> json) =>
    VerifyRegisterOtpRequest(
      otp: json['otp'] as String?,
      phoneNumber: json['phone_number'] as String?,
    );

Map<String, dynamic> _$VerifyRegisterOtpRequestToJson(
        VerifyRegisterOtpRequest instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'phone_number': instance.phoneNumber,
    };
