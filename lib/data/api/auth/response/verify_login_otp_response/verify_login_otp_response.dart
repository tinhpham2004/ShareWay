import 'package:json_annotation/json_annotation.dart';

import 'verify_login_otp_data_response.dart';

part 'verify_login_otp_response.g.dart';

@JsonSerializable()
class VerifyLoginOtpResponse {
  VerifyLoginOtpDataResponse? data;
  String? error;
  @JsonKey(name: 'message_en')
  String? messageEn;
  @JsonKey(name: 'message_vi')
  String? messageVi;
  bool? success;

  VerifyLoginOtpResponse({
    this.data,
    this.error,
    this.messageEn,
    this.messageVi,
    this.success,
  });

  factory VerifyLoginOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyLoginOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyLoginOtpResponseToJson(this);
}
