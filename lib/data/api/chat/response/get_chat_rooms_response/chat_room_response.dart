import 'package:json_annotation/json_annotation.dart';

import 'get_chat_room_receiver_info_response.dart';

part 'chat_room_response.g.dart';

@JsonSerializable()
class ChatRoomResponse {
  @JsonKey(name: 'last_message')
  String? lastMessage;
  @JsonKey(name: 'last_message_at')
  DateTime? lastMessageAt;
  @JsonKey(name: 'last_message_id')
  String? lastMessageId;
  @JsonKey(name: 'receiver_info')
  GetChatRoomReceiverInfoResponse? receiverInfo;
  @JsonKey(name: 'room_id')
  String? roomId;

  ChatRoomResponse({
    this.lastMessage,
    this.lastMessageAt,
    this.lastMessageId,
    this.receiverInfo,
    this.roomId,
  });

  factory ChatRoomResponse.fromJson(Map<String, dynamic> json) {
    return _$ChatRoomResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChatRoomResponseToJson(this);
}
