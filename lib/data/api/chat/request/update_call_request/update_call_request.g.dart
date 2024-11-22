// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_call_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCallRequest _$UpdateCallRequestFromJson(Map<String, dynamic> json) =>
    UpdateCallRequest(
      callId: json['callID'] as String?,
      callType: json['callType'] as String?,
      chatRoomId: json['chatRoomID'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      receiverId: json['receiverID'] as String?,
    );

Map<String, dynamic> _$UpdateCallRequestToJson(UpdateCallRequest instance) =>
    <String, dynamic>{
      'callID': instance.callId,
      'callType': instance.callType,
      'chatRoomID': instance.chatRoomId,
      'duration': instance.duration,
      'receiverID': instance.receiverId,
    };
