import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/domain/auth/input/verify_register_otp_input.dart';

part 'verify_register_otp_request.g.dart';

@JsonSerializable()
class VerifyRegisterOtpRequest {
  String? otp;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  VerifyRegisterOtpRequest({this.otp, this.phoneNumber});

  Map<String, dynamic> toJson() => _$VerifyRegisterOtpRequestToJson(this);

  factory VerifyRegisterOtpRequest.toApiModel(VerifyRegisterOtpInput data) {
    return VerifyRegisterOtpRequest(
      otp: data.otp,
      phoneNumber: data.phoneNumber,
    );
  }
}
