import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/domain/chat/input/update_call_input.dart';

part 'update_call_request.g.dart';

@JsonSerializable()
class UpdateCallRequest {
  @JsonKey(name: 'callID')
  String? callId;
  String? callType;
  @JsonKey(name: 'chatRoomID')
  String? chatRoomId;
  int? duration;
  @JsonKey(name: 'receiverID')
  String? receiverId;

  UpdateCallRequest({
    this.callId,
    this.callType,
    this.chatRoomId,
    this.duration,
    this.receiverId,
  });

  factory UpdateCallRequest.fromJson(Map<String, dynamic> json) {
    return _$UpdateCallRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateCallRequestToJson(this);

  factory UpdateCallRequest.toApiModel(UpdateCallInput input) {
    return UpdateCallRequest(
      callId: input.callId,
      callType: input.type.getString(),
      chatRoomId: input.roomId,
      duration: input.duration,
      receiverId: input.receiverId,
    );
  }
}
