// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_chat_rooms_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetChatRoomsResponse _$GetChatRoomsResponseFromJson(
        Map<String, dynamic> json) =>
    GetChatRoomsResponse(
      data: json['data'] == null
          ? null
          : GetChatRoomsDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
      messageEn: json['message_en'] as String?,
      messageVi: json['message_vi'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$GetChatRoomsResponseToJson(
        GetChatRoomsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
      'message_en': instance.messageEn,
      'message_vi': instance.messageVi,
      'success': instance.success,
    };
