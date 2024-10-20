import 'package:json_annotation/json_annotation.dart';

part 'init_register_data_response.g.dart';

@JsonSerializable()
class InitRegisterDataResponse {
  @JsonKey(name: 'is_activated')
  bool? isActivated;
  @JsonKey(name: 'is_verified')
  bool? isVerified;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  InitRegisterDataResponse(
      {this.isActivated, this.isVerified, this.phoneNumber});

  factory InitRegisterDataResponse.fromJson(Map<String, dynamic> json) =>
      _$InitRegisterDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InitRegisterDataResponseToJson(this);
}
