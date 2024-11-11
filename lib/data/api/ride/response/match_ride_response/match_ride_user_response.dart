import 'package:json_annotation/json_annotation.dart';

part 'match_ride_user_response.g.dart';

@JsonSerializable()
class MatchRideUserResponse {
  @JsonKey(name: 'full_name')
  String? fullName;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'user_id')
  String? userId;

  MatchRideUserResponse({this.fullName, this.phoneNumber, this.userId});

  factory MatchRideUserResponse.fromJson(Map<String, dynamic> json) =>
      _$MatchRideUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MatchRideUserResponseToJson(this);
}
