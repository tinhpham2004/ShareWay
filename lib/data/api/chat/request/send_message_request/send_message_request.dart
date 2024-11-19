import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/domain/chat/input/send_message_input.dart';

part 'send_message_request.g.dart';

@JsonSerializable()
class SendMessageRequest {
  @JsonKey(name: 'chatRoomID')
  String? chatRoomId;
  String? message;
  @JsonKey(name: 'receiverID')
  String? receiverId;

  SendMessageRequest({this.chatRoomId, this.message, this.receiverId});

  Map<String, dynamic> toJson() => _$SendMessageRequestToJson(this);

  factory SendMessageRequest.toApiModel(SendMessageInput input) =>
      SendMessageRequest(
        chatRoomId: input.roomId,
        message: input.message,
        receiverId: input.receiverId,
      );
}
