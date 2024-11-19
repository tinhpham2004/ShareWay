// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_chat_messages_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetChatMessagesDataResponse _$GetChatMessagesDataResponseFromJson(
        Map<String, dynamic> json) =>
    GetChatMessagesDataResponse(
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => MessageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetChatMessagesDataResponseToJson(
        GetChatMessagesDataResponse instance) =>
    <String, dynamic>{
      'messages': instance.messages,
    };
