import 'package:json_annotation/json_annotation.dart';

part 'new_give_ride_request_user.g.dart';

@JsonSerializable()
class NewGiveRideRequestUser {
  String? id;
  String? phoneNumber;
  String? fullName;

  NewGiveRideRequestUser({this.id, this.phoneNumber, this.fullName});

  factory NewGiveRideRequestUser.fromJson(Map<String, dynamic> json) => _$NewGiveRideRequestUserFromJson(json);

  Map<String, dynamic> toJson() => _$NewGiveRideRequestUserToJson(this);
}
