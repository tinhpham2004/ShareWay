import 'package:json_annotation/json_annotation.dart';

part 'message_response.g.dart';

@JsonSerializable()
class MessageResponse {
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  String? message;
  @JsonKey(name: 'message_id')
  String? messageId;
  @JsonKey(name: 'message_type')
  String? messageType;
  @JsonKey(name: 'receiver_id')
  String? receiverId;
  @JsonKey(name: 'sender_id')
  String? senderId;

  MessageResponse({
    this.createdAt,
    this.message,
    this.messageId,
    this.messageType,
    this.receiverId,
    this.senderId,
  });

  factory MessageResponse.fromJson(Map<String, dynamic> json) {
    return _$MessageResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);
}
