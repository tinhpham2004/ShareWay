// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitRegisterResponse _$InitRegisterResponseFromJson(
        Map<String, dynamic> json) =>
    InitRegisterResponse(
      data: json['data'] == null
          ? null
          : InitRegisterDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
      messageEn: json['message_en'] as String?,
      messageVi: json['message_vi'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$InitRegisterResponseToJson(
        InitRegisterResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
      'message_en': instance.messageEn,
      'message_vi': instance.messageVi,
      'success': instance.success,
    };