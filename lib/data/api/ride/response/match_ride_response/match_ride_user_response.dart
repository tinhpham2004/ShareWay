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
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;
  @JsonKey(name: 'average_rating')
  double? averageRating;
  @JsonKey(name: 'gender')
  String? gender;

  MatchRideUserResponse({
    this.fullName,
    this.phoneNumber,
    this.userId,
    this.avatarUrl,
    this.averageRating,
    this.gender,
  });

  factory MatchRideUserResponse.fromJson(Map<String, dynamic> json) =>
      _$MatchRideUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MatchRideUserResponseToJson(this);
}
