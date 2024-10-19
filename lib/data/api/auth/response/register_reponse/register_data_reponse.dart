import 'package:json_annotation/json_annotation.dart';

part 'register_data_reponse.g.dart';

@JsonSerializable()
class RegisterDataResponse {
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

  RegisterDataResponse({
    this.fullName,
    this.isActivated,
    this.isVerified,
    this.phoneNumber,
    this.userId,
  });

  factory RegisterDataResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataResponseFromJson(json);
}
