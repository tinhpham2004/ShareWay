import 'package:json_annotation/json_annotation.dart';

import 'message_response.dart';

part 'get_chat_messages_data_response.g.dart';

@JsonSerializable()
class GetChatMessagesDataResponse {
  List<MessageResponse>? messages;

  GetChatMessagesDataResponse({this.messages});

  factory GetChatMessagesDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GetChatMessagesDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetChatMessagesDataResponseToJson(this);
}
