import 'package:json_annotation/json_annotation.dart';

part 'suggest_give_riders_user_response.g.dart';

@JsonSerializable()
class SuggestGiveRidersUserResponse {
  @JsonKey(name: 'full_name')
  String? fullName;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'user_id')
  String? userId;
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;
  @JsonKey(name: 'gender')
  String? gender;

  SuggestGiveRidersUserResponse({
    this.fullName,
    this.phoneNumber,
    this.userId,
    this.avatarUrl,
    this.gender,
  });

  factory SuggestGiveRidersUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SuggestGiveRidersUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestGiveRidersUserResponseToJson(this);
}
