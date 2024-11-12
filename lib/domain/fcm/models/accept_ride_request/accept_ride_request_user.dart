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

  AcceptRideRequestUser({
    this.id,
    this.phoneNumber,
    this.fullName,
  });

  /// Factory method for JSON deserialization
  factory AcceptRideRequestUser.fromJson(Map<String, dynamic> json) =>
      _$AcceptRideRequestUserFromJson(json);

  /// Method for JSON serialization
  Map<String, dynamic> toJson() => _$AcceptRideRequestUserToJson(this);
}
