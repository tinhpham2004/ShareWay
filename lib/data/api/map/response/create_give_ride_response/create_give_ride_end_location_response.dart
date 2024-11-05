import 'package:json_annotation/json_annotation.dart';

part 'create_give_ride_end_location_response.g.dart';

@JsonSerializable()
class CreateGiveRideEndLocationResponse {
  double? lat;
  double? lng;

  CreateGiveRideEndLocationResponse({this.lat, this.lng});

  factory CreateGiveRideEndLocationResponse.fromJson(
      Map<String, dynamic> json) {
    return _$CreateGiveRideEndLocationResponseFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$CreateGiveRideEndLocationResponseToJson(this);
}
