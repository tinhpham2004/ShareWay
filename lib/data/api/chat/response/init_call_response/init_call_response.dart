import 'package:json_annotation/json_annotation.dart';

import 'init_call_data_response.dart';

part 'init_call_response.g.dart';

@JsonSerializable()
class InitCallResponse {
  InitCallDataResponse? data;
  String? error;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;
  bool? success;

  InitCallResponse({
    this.data,
    this.error,
    this.messageEn,
    this.messageVi,
    this.success,
  });

  factory InitCallResponse.fromJson(Map<String, dynamic> json) {
    return _$InitCallResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InitCallResponseToJson(this);
}
