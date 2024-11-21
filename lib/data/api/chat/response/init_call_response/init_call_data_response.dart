import 'package:json_annotation/json_annotation.dart';

part 'init_call_data_response.g.dart';

@JsonSerializable()
class InitCallDataResponse {
  @JsonKey(name: 'caller_id')
  String? callerId;
  @JsonKey(name: 'chatroom_id')
  String? chatroomId;
  @JsonKey(name: 'receiver_id')
  String? receiverId;
  String? token;
  @JsonKey(name: 'call_id')
  String? callId;

  InitCallDataResponse({
    this.callerId,
    this.chatroomId,
    this.receiverId,
    this.token,
    this.callId,
  });

  factory InitCallDataResponse.fromJson(Map<String, dynamic> json) => _$InitCallDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InitCallDataResponseToJson(this);
}
