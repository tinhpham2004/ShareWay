import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/data/api/user/response/user_response/user_response.dart';

part 'verify_login_otp_data_response.g.dart';

@JsonSerializable()
class VerifyLoginOtpDataResponse {
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;
  UserResponse? user;

  VerifyLoginOtpDataResponse({this.accessToken, this.refreshToken, this.user});

  factory VerifyLoginOtpDataResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyLoginOtpDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyLoginOtpDataResponseToJson(this);
}
