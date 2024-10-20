import 'package:json_annotation/json_annotation.dart';

import 'login_phone_data_response.dart';

part 'login_phone_response.g.dart';

@JsonSerializable()
class LoginPhoneResponse {
  LoginPhoneDataResponse? data;
  String? error;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;
  bool? success;

  LoginPhoneResponse({
    this.data,
    this.error,
    this.messageEn,
    this.messageVi,
    this.success,
  });

  factory LoginPhoneResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginPhoneResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginPhoneResponseToJson(this);
}
