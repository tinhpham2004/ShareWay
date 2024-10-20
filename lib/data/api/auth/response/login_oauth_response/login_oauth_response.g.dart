// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_oauth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginOauthResponse _$LoginOauthResponseFromJson(Map<String, dynamic> json) =>
    LoginOauthResponse(
      data: json['data'] == null
          ? null
          : LoginOauthDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
      messageEn: json['message_en'] as String?,
      messageVi: json['message_vi'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$LoginOauthResponseToJson(LoginOauthResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
      'message_en': instance.messageEn,
      'message_vi': instance.messageVi,
      'success': instance.success,
    };
