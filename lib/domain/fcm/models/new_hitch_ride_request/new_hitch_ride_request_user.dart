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

  NewHitchRideRequestUser({
    this.id,
    this.phoneNumber,
    this.fullName,
  });

  /// Factory method for JSON deserialization
  factory NewHitchRideRequestUser.fromJson(Map<String, dynamic> json) =>
      _$NewHitchRideRequestUserFromJson(json);

  /// Method for JSON serialization
  Map<String, dynamic> toJson() => _$NewHitchRideRequestUserToJson(this);
}
