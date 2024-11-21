// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_call_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitCallDataResponse _$InitCallDataResponseFromJson(
        Map<String, dynamic> json) =>
    InitCallDataResponse(
      callerId: json['caller_id'] as String?,
      chatroomId: json['chatroom_id'] as String?,
      receiverId: json['receiver_id'] as String?,
      token: json['token'] as String?,
      callId: json['call_id'] as String?,
    );

Map<String, dynamic> _$InitCallDataResponseToJson(
        InitCallDataResponse instance) =>
    <String, dynamic>{
      'caller_id': instance.callerId,
      'chatroom_id': instance.chatroomId,
      'receiver_id': instance.receiverId,
      'token': instance.token,
      'call_id': instance.callId,
    };
