import 'package:json_annotation/json_annotation.dart';

part 'create_give_ride_start_location_response.g.dart';

@JsonSerializable()
class CreateGiveRideStartLocationResponse {
  double? lat;
  double? lng;

  CreateGiveRideStartLocationResponse({this.lat, this.lng});

  factory CreateGiveRideStartLocationResponse.fromJson(
      Map<String, dynamic> json) {
    return _$CreateGiveRideStartLocationResponseFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$CreateGiveRideStartLocationResponseToJson(this);
}
