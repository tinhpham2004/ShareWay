import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/data/api/map/response/create_give_ride_response/create_give_ride_duration_response.dart';

import 'create_give_ride_distance_response.dart';
import 'create_give_ride_end_location_response.dart';
import 'create_give_ride_polyline_response.dart';
import 'create_give_ride_start_location_response.dart';

part 'create_give_ride_step_response.g.dart';

@JsonSerializable()
class CreateGiveRideStepResponse {
  CreateGiveRideDistanceResponse? distance;
  CreateGiveRideDurationResponse? duration;
  @JsonKey(name: 'end_location')
  CreateGiveRideEndLocationResponse? endLocation;
  @JsonKey(name: 'html_instructions')
  String? htmlInstructions;
  String? maneuver;
  CreateGiveRidePolylineResponse? polyline;
  @JsonKey(name: 'start_location')
  CreateGiveRideStartLocationResponse? startLocation;
  @JsonKey(name: 'travel_mode')
  String? travelMode;

  CreateGiveRideStepResponse({
    this.distance,
    this.duration,
    this.endLocation,
    this.htmlInstructions,
    this.maneuver,
    this.polyline,
    this.startLocation,
    this.travelMode,
  });

  factory CreateGiveRideStepResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateGiveRideStepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateGiveRideStepResponseToJson(this);
}
