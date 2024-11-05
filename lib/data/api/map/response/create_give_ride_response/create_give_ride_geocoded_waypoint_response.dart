import 'package:json_annotation/json_annotation.dart';

part 'create_give_ride_geocoded_waypoint_response.g.dart';

@JsonSerializable()
class CreateGiveRideGeocodedWaypointResponse {
  @JsonKey(name: 'geocoder_status')
  String? geocoderStatus;
  @JsonKey(name: 'place_id')
  String? placeId;

  CreateGiveRideGeocodedWaypointResponse({this.geocoderStatus, this.placeId});

  factory CreateGiveRideGeocodedWaypointResponse.fromJson(
      Map<String, dynamic> json) {
    return _$CreateGiveRideGeocodedWaypointResponseFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$CreateGiveRideGeocodedWaypointResponseToJson(this);
}
