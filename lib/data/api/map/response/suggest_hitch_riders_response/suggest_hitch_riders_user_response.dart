import 'package:json_annotation/json_annotation.dart';

part 'suggest_hitch_riders_user_response.g.dart';

@JsonSerializable()
class SuggestHitchRidersUserResponse {
  @JsonKey(name: 'full_name')
  String? fullName;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'user_id')
  String? userId;

  SuggestHitchRidersUserResponse({this.fullName, this.phoneNumber, this.userId});

  factory SuggestHitchRidersUserResponse.fromJson(Map<String, dynamic> json) => _$SuggestHitchRidersUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestHitchRidersUserResponseToJson(this);
}
