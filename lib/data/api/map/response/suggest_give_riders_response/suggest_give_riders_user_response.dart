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

  SuggestGiveRidersUserResponse({this.fullName, this.phoneNumber, this.userId});

  factory SuggestGiveRidersUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SuggestGiveRidersUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestGiveRidersUserResponseToJson(this);
}
