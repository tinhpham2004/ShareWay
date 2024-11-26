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

  PendingRideUserResponse({this.userId, this.phoneNumber, this.fullName});

  factory PendingRideUserResponse.fromJson(Map<String, dynamic> json) => _$PendingRideUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PendingRideUserResponseToJson(this);
}
