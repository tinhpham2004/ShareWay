import 'package:json_annotation/json_annotation.dart';

import 'register_data_response.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  RegisterDataResponse? data;
  String? error;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;
  bool? success;

  RegisterResponse(
      {this.data, this.error, this.messageEn, this.messageVi, this.success});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}
