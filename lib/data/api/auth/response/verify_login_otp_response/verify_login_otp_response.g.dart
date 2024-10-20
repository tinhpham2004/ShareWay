// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_login_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyLoginOtpResponse _$VerifyLoginOtpResponseFromJson(
        Map<String, dynamic> json) =>
    VerifyLoginOtpResponse(
      data: json['data'] == null
          ? null
          : VerifyLoginOtpDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
      messageEn: json['message_en'] as String?,
      messageVi: json['message_vi'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$VerifyLoginOtpResponseToJson(
        VerifyLoginOtpResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
      'message_en': instance.messageEn,
      'message_vi': instance.messageVi,
      'success': instance.success,
    };
