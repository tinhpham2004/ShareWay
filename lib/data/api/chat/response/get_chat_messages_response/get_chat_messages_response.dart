import 'package:json_annotation/json_annotation.dart';

import 'get_chat_messages_data_response.dart';

part 'get_chat_messages_response.g.dart';

@JsonSerializable()
class GetChatMessagesResponse {
  GetChatMessagesDataResponse? data;
  dynamic error;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;
  bool? success;

  GetChatMessagesResponse({
    this.data,
    this.error,
    this.messageEn,
    this.messageVi,
    this.success,
  });

  factory GetChatMessagesResponse.fromJson(Map<String, dynamic> json) {
    return _$GetChatMessagesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetChatMessagesResponseToJson(this);
}
