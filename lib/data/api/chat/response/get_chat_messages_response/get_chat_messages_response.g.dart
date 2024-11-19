// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_chat_messages_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetChatMessagesResponse _$GetChatMessagesResponseFromJson(
        Map<String, dynamic> json) =>
    GetChatMessagesResponse(
      data: json['data'] == null
          ? null
          : GetChatMessagesDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      error: json['error'],
      messageEn: json['message_en'] as String?,
      messageVi: json['message_vi'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$GetChatMessagesResponseToJson(
        GetChatMessagesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
      'message_en': instance.messageEn,
      'message_vi': instance.messageVi,
      'success': instance.success,
    };
