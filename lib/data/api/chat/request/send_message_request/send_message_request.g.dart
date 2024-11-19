// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageRequest _$SendMessageRequestFromJson(Map<String, dynamic> json) =>
    SendMessageRequest(
      chatRoomId: json['chatRoomID'] as String?,
      message: json['message'] as String?,
      receiverId: json['receiverID'] as String?,
    );

Map<String, dynamic> _$SendMessageRequestToJson(SendMessageRequest instance) =>
    <String, dynamic>{
      'chatRoomID': instance.chatRoomId,
      'message': instance.message,
      'receiverID': instance.receiverId,
    };
