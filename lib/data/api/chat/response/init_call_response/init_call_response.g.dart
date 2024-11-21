// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_call_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitCallResponse _$InitCallResponseFromJson(Map<String, dynamic> json) =>
    InitCallResponse(
      data: json['data'] == null
          ? null
          : InitCallDataResponse.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
      messageEn: json['message_en'] as String?,
      messageVi: json['message_vi'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$InitCallResponseToJson(InitCallResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
      'message_en': instance.messageEn,
      'message_vi': instance.messageVi,
      'success': instance.success,
    };
