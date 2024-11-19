// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) =>
    MessageResponse(
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      message: json['message'] as String?,
      messageId: json['message_id'] as String?,
      messageType: json['message_type'] as String?,
      receiverId: json['receiver_id'] as String?,
      senderId: json['sender_id'] as String?,
    );

Map<String, dynamic> _$MessageResponseToJson(MessageResponse instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt?.toIso8601String(),
      'message': instance.message,
      'message_id': instance.messageId,
      'message_type': instance.messageType,
      'receiver_id': instance.receiverId,
      'sender_id': instance.senderId,
    };
