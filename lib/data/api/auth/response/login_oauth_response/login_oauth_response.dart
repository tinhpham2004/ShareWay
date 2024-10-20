import 'package:json_annotation/json_annotation.dart';

import 'login_oauth_data_response.dart';

part 'login_oauth_response.g.dart';

@JsonSerializable()
class LoginOauthResponse {
  LoginOauthDataResponse? data;
  String? error;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;
  bool? success;

  LoginOauthResponse({
    this.data,
    this.error,
    this.messageEn,
    this.messageVi,
    this.success,
  });

  factory LoginOauthResponse.fromJson(Map<String, dynamic> json) {
    return _$LoginOauthResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginOauthResponseToJson(this);
}
