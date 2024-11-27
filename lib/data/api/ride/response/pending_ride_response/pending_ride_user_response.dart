import 'package:json_annotation/json_annotation.dart';

part 'pending_ride_user_response.g.dart';

@JsonSerializable()
class PendingRideUserResponse {
  @JsonKey(name: 'user_id')
  String? userId;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'full_name')
  String? fullName;
  @JsonKey(name: 'avatar_url')
  String? avatarUrl;
  @JsonKey(name: 'gender')
  String? gender;

  PendingRideUserResponse({
    this.userId,
    this.phoneNumber,
    this.fullName,
    this.avatarUrl,
    this.gender,
  });

  factory PendingRideUserResponse.fromJson(Map<String, dynamic> json) =>
      _$PendingRideUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PendingRideUserResponseToJson(this);
}
