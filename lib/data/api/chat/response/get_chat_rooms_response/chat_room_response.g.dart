// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomResponse _$ChatRoomResponseFromJson(Map<String, dynamic> json) =>
    ChatRoomResponse(
      lastMessage: json['last_message'] as String?,
      lastMessageAt: json['last_message_at'] == null
          ? null
          : DateTime.parse(json['last_message_at'] as String),
      lastMessageId: json['last_message_id'] as String?,
      receiverInfo: json['receiver_info'] == null
          ? null
          : GetChatRoomReceiverInfoResponse.fromJson(
              json['receiver_info'] as Map<String, dynamic>),
      roomId: json['room_id'] as String?,
    );

Map<String, dynamic> _$ChatRoomResponseToJson(ChatRoomResponse instance) =>
    <String, dynamic>{
      'last_message': instance.lastMessage,
      'last_message_at': instance.lastMessageAt?.toIso8601String(),
      'last_message_id': instance.lastMessageId,
      'receiver_info': instance.receiverInfo,
      'room_id': instance.roomId,
    };
