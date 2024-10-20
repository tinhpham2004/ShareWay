// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_phone_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginPhoneResponse _$LoginPhoneResponseFromJson(Map<String, dynamic> json) =>
    LoginPhoneResponse(
      data: json['data'] == null
          ? null
          : LoginPhoneDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
      messageEn: json['message_en'] as String?,
      messageVi: json['message_vi'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$LoginPhoneResponseToJson(LoginPhoneResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
      'message_en': instance.messageEn,
      'message_vi': instance.messageVi,
      'success': instance.success,
    };
