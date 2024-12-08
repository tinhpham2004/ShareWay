import 'package:json_annotation/json_annotation.dart';

part 'new_hitch_ride_request_user.g.dart';

@JsonSerializable()
class NewHitchRideRequestUser {
  @JsonKey(name: 'user_id')
  String? id;

  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  @JsonKey(name: 'full_name')
  String? fullName;

  @JsonKey(name: 'avatar_url')
  String? avatarUrl;

  @JsonKey(name: 'average_rating')
  double? averageRating;

  @JsonKey(name: 'gender')
  String? gender;

  NewHitchRideRequestUser({
    this.id,
    this.phoneNumber,
    this.fullName,
    this.avatarUrl,
    this.averageRating,
    this.gender,
  });

  /// Factory method for JSON deserialization
  factory NewHitchRideRequestUser.fromJson(Map<String, dynamic> json) =>
      _$NewHitchRideRequestUserFromJson(json);

  /// Method for JSON serialization
  Map<String, dynamic> toJson() => _$NewHitchRideRequestUserToJson(this);
}
