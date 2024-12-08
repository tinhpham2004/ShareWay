import 'package:json_annotation/json_annotation.dart';

part 'new_give_ride_request_user.g.dart';

@JsonSerializable()
class NewGiveRideRequestUser {
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

  NewGiveRideRequestUser({
    this.id,
    this.phoneNumber,
    this.fullName,
    this.avatarUrl,
    this.averageRating,
    this.gender,
  });

  factory NewGiveRideRequestUser.fromJson(Map<String, dynamic> json) =>
      _$NewGiveRideRequestUserFromJson(json);

  Map<String, dynamic> toJson() => _$NewGiveRideRequestUserToJson(this);
}
