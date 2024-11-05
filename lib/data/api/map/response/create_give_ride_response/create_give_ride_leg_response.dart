import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/data/api/map/response/create_give_ride_response/create_give_ride_duration_response.dart';

import 'create_give_ride_distance_response.dart';
import 'create_give_ride_end_location_response.dart';
import 'create_give_ride_start_location_response.dart';
import 'create_give_ride_step_response.dart';

part 'create_give_ride_leg_response.g.dart';

@JsonSerializable()
class CreateGiveRideLegResponse {
  CreateGiveRideDistanceResponse? distance;
  CreateGiveRideDurationResponse? duration;
  @JsonKey(name: 'end_address')
  String? endAddress;
  @JsonKey(name: 'start_address')
  String? startAddress;
  @JsonKey(name: 'end_location')
  CreateGiveRideEndLocationResponse? endLocation;
  @JsonKey(name: 'start_location')
  CreateGiveRideStartLocationResponse? startLocation;
  @JsonKey(name: 'steps')
  List<CreateGiveRideStepResponse>? steps;

  CreateGiveRideLegResponse({
    this.distance,
    this.duration,
    this.endAddress,
    this.startAddress,
    this.endLocation,
    this.startLocation,
    this.steps,
  });

  factory CreateGiveRideLegResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateGiveRideLegResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateGiveRideLegResponseToJson(this);
}
