import 'package:json_annotation/json_annotation.dart';

part 'accept_ride_request_user.g.dart';

@JsonSerializable()
class AcceptRideRequestUser {
  @JsonKey(name: 'user_id')
  String? id;

  @JsonKey(name: 'phone_number')
  String? phoneNumber;

  @JsonKey(name: 'full_name')
  String? fullName;

  @JsonKey(name: 'avatar_url')
  String? avatarUrl;

  @JsonKey(name: 'gender')
  String? gender;

  AcceptRideRequestUser({
    this.id,
    this.phoneNumber,
    this.fullName,
    this.avatarUrl,
    this.gender,
  });

  /// Factory method for JSON deserialization
  factory AcceptRideRequestUser.fromJson(Map<String, dynamic> json) =>
      _$AcceptRideRequestUserFromJson(json);

  /// Method for JSON serialization
  Map<String, dynamic> toJson() => _$AcceptRideRequestUserToJson(this);
}
