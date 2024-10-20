import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/domain/auth/input/verify_login_otp_input.dart';

part 'verify_login_otp_request.g.dart';

@JsonSerializable()
class VerifyLoginOtpRequest {
  String? otp;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'user_id')
  String? userId;

  VerifyLoginOtpRequest({this.otp, this.phoneNumber, this.userId});

  Map<String, dynamic> toJson() => _$VerifyLoginOtpRequestToJson(this);

  factory VerifyLoginOtpRequest.toApiModel(VerifyLoginOtpInput data) {
    return VerifyLoginOtpRequest(
      otp: data.otp,
      phoneNumber: data.phoneNumber,
      userId: data.userId,
    );
  }
}
