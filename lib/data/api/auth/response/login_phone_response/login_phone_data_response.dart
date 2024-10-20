import 'package:json_annotation/json_annotation.dart';

part 'login_phone_data_response.g.dart';

@JsonSerializable()
class LoginPhoneDataResponse {
  @JsonKey(name: 'is_activated')
  bool? isActivated;
  @JsonKey(name: 'is_verified')
  bool? isVerified;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'user_id')
  String? userId;

  LoginPhoneDataResponse(
      {this.isActivated, this.isVerified, this.phoneNumber, this.userId});

  factory LoginPhoneDataResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginPhoneDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginPhoneDataResponseToJson(this);
}
