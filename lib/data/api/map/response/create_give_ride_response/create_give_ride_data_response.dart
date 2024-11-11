import 'package:json_annotation/json_annotation.dart';

import 'create_give_ride_route_response.dart';
import 'create_give_ride_vehicle_response.dart';

part 'create_give_ride_data_response.g.dart';

@JsonSerializable()
class CreateGiveRideDataResponse {
  CreateGiveRideRouteResponse? route;
  @JsonKey(name: 'ride_offer_id')
  String? rideOfferId;
  int? distance;
  int? duration;
  @JsonKey(name: 'start_time')
  String? startTime;
  @JsonKey(name: 'end_time')
  String? endTime;
  double? fare;
  CreateGiveRideVehicleResponse? vehicle;

  CreateGiveRideDataResponse({
    this.route,
    this.rideOfferId,
    this.distance,
    this.duration,
    this.startTime,
    this.endTime,
    this.fare,
    this.vehicle,
  });

  factory CreateGiveRideDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateGiveRideDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateGiveRideDataResponseToJson(this);
}
