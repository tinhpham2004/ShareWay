import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/domain/chat/input/init_call_input.dart';

part 'init_call_request.g.dart';

@JsonSerializable()
class InitCallRequest {
  @JsonKey(name: 'chatRoomID')
  String? chatRoomId;
  @JsonKey(name: 'receiverID ')
  String? receiverId;

  InitCallRequest({this.chatRoomId, this.receiverId});

  Map<String, dynamic> toJson() => _$InitCallRequestToJson(this);

  factory InitCallRequest.toApiModel(InitCallInput input) {
    return InitCallRequest(
      chatRoomId: input.chatRoomId,
      receiverId: input.receiverId,
    );
  }
}
