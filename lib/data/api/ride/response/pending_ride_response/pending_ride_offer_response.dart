import 'package:json_annotation/json_annotation.dart';

import 'pending_ride_user_response.dart';
import 'pending_ride_vehicle_response.dart';

part 'pending_ride_offer_response.g.dart';

@JsonSerializable()
class PendingRideOfferResponse {
  @JsonKey(name: 'ride_offer_id')
  String? rideOfferId;
  PendingRideUserResponse? user;
  PendingRideVehicleResponse? vehicle;
  @JsonKey(name: 'start_latitude')
  double? startLatitude;
  @JsonKey(name: 'start_longitude')
  double? startLongitude;
  @JsonKey(name: 'end_latitude')
  double? endLatitude;
  @JsonKey(name: 'end_longitude')
  double? endLongitude;
  @JsonKey(name: 'start_address')
  String? startAddress;
  @JsonKey(name: 'end_address')
  String? endAddress;
  @JsonKey(name: 'encoded_polyline')
  String? encodedPolyline;
  int? distance;
  int? duration;
  @JsonKey(name: 'driver_current_latitude')
  double? driverCurrentLatitude;
  @JsonKey(name: 'driver_current_longitude')
  double? driverCurrentLongitude;
  @JsonKey(name: 'start_time')
  DateTime? startTime;
  @JsonKey(name: 'end_time')
  DateTime? endTime;
  String? status;
  double? fare;

  PendingRideOfferResponse({
    this.rideOfferId,
    this.user,
    this.vehicle,
    this.startLatitude,
    this.startLongitude,
    this.endLatitude,
    this.endLongitude,
    this.startAddress,
    this.endAddress,
    this.encodedPolyline,
    this.distance,
    this.duration,
    this.driverCurrentLatitude,
    this.driverCurrentLongitude,
    this.startTime,
    this.endTime,
    this.status,
    this.fare,
  });

  factory PendingRideOfferResponse.fromJson(Map<String, dynamic> json) {
    return _$PendingRideOfferResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PendingRideOfferResponseToJson(this);
}
