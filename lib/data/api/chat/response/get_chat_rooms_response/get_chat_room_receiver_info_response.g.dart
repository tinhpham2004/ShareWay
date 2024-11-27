// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_chat_room_receiver_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetChatRoomReceiverInfoResponse _$GetChatRoomReceiverInfoResponseFromJson(
        Map<String, dynamic> json) =>
    GetChatRoomReceiverInfoResponse(
      fullName: json['full_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      userId: json['user_id'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$GetChatRoomReceiverInfoResponseToJson(
        GetChatRoomReceiverInfoResponse instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'phone_number': instance.phoneNumber,
      'user_id': instance.userId,
      'avatar_url': instance.avatarUrl,
      'gender': instance.gender,
    };
