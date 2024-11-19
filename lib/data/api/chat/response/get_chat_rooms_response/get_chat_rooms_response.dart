import 'package:json_annotation/json_annotation.dart';

import 'get_chat_rooms_data_response.dart';

part 'get_chat_rooms_response.g.dart';

@JsonSerializable()
class GetChatRoomsResponse {
  GetChatRoomsDataResponse? data;
  String? error;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;
  bool? success;

  GetChatRoomsResponse({
    this.data,
    this.error,
    this.messageEn,
    this.messageVi,
    this.success,
  });

  factory GetChatRoomsResponse.fromJson(Map<String, dynamic> json) {
    return _$GetChatRoomsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetChatRoomsResponseToJson(this);
}
