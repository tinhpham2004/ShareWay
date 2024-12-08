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
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;
  @JsonKey(name: 'average_rating')
  double? averageRating;
  @JsonKey(name: 'gender')
  String? gender;

  GetChatRoomReceiverInfoResponse({
    this.fullName,
    this.phoneNumber,
    this.userId,
    this.avatarUrl,
    this.gender,
    this.averageRating,
  });

  factory GetChatRoomReceiverInfoResponse.fromJson(Map<String, dynamic> json) {
    return _$GetChatRoomReceiverInfoResponseFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$GetChatRoomReceiverInfoResponseToJson(this);
}
