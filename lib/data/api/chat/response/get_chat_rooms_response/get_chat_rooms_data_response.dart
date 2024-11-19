import 'package:json_annotation/json_annotation.dart';

import 'chat_room_response.dart';

part 'get_chat_rooms_data_response.g.dart';

@JsonSerializable()
class GetChatRoomsDataResponse {
  List<ChatRoomResponse>? chatRooms;

  GetChatRoomsDataResponse({this.chatRooms});

  factory GetChatRoomsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GetChatRoomsDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetChatRoomsDataResponseToJson(this);
}
