// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_chat_rooms_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetChatRoomsDataResponse _$GetChatRoomsDataResponseFromJson(
        Map<String, dynamic> json) =>
    GetChatRoomsDataResponse(
      chatRooms: (json['chatRooms'] as List<dynamic>?)
          ?.map((e) => ChatRoomResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetChatRoomsDataResponseToJson(
        GetChatRoomsDataResponse instance) =>
    <String, dynamic>{
      'chatRooms': instance.chatRooms,
    };
