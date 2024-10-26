import 'package:json_annotation/json_annotation.dart';

part 'login_oauth_data_response.g.dart';

@JsonSerializable()
class LoginOauthDataResponse {
  @JsonKey(name: 'full_name')
  String? fullName;
  @JsonKey(name: 'is_activated')
  bool? isActivated;
  @JsonKey(name: 'is_verified')
  bool? isVerified;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'user_id')
  String? userId;

  LoginOauthDataResponse({
    this.fullName,
    this.isActivated,
    this.isVerified,
    this.phoneNumber,
    this.userId,
  });

  factory LoginOauthDataResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginOauthDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginOauthDataResponseToJson(this);
}
