// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_call_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitCallRequest _$InitCallRequestFromJson(Map<String, dynamic> json) =>
    InitCallRequest(
      chatRoomId: json['chatRoomID'] as String?,
      receiverId: json['receiverID'] as String?,
      expireTime: (json['expireTime'] as num?)?.toInt(),
    );

Map<String, dynamic> _$InitCallRequestToJson(InitCallRequest instance) =>
    <String, dynamic>{
      'chatRoomID': instance.chatRoomId,
      'receiverID': instance.receiverId,
      'expireTime': instance.expireTime,
    };
