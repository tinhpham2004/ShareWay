import 'package:json_annotation/json_annotation.dart';

part 'get_chat_room_receiver_info_response.g.dart';

@JsonSerializable()
class GetChatRoomReceiverInfoResponse {
  @JsonKey(name: 'full_name')
  String? fullName;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'user_id')
  String? userId;

  GetChatRoomReceiverInfoResponse(
      {this.fullName, this.phoneNumber, this.userId});

  factory GetChatRoomReceiverInfoResponse.fromJson(Map<String, dynamic> json) {
    return _$GetChatRoomReceiverInfoResponseFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$GetChatRoomReceiverInfoResponseToJson(this);
}
