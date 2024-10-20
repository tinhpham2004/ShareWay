import 'package:json_annotation/json_annotation.dart';

import 'init_register_data_response.dart';

part 'init_register_response.g.dart';

@JsonSerializable()
class InitRegisterResponse {
  InitRegisterDataResponse? data;
  String? error;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;
  bool? success;

  InitRegisterResponse({
    this.data,
    this.error,
    this.messageEn,
    this.messageVi,
    this.success,
  });

  factory InitRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$InitRegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InitRegisterResponseToJson(this);
}
