import 'package:share_way_frontend/data/api/chat/response/init_call_response/init_call_response.dart';

class InitCallOutput {
  final String? callId;
  final String? token;
  final String? roomId;
  final String? callerId;
  final String? receiverId;

  InitCallOutput({
    this.callId,
    this.token,
    this.roomId,
    this.callerId,
    this.receiverId,
  });

  factory InitCallOutput.fromApiModel(InitCallResponse response) {
    return InitCallOutput(
      callId: response.data?.callId,
      token: response.data?.token,
      roomId: response.data?.chatroomId,
      callerId: response.data?.callerId,
      receiverId: response.data?.receiverId,
    );
  }
}
