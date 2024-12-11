import 'package:json_annotation/json_annotation.dart';

import 'history_ride_driver_response.dart';
import 'history_ride_hitcher_response.dart';
import 'history_ride_transaction_response.dart';
import 'history_ride_vehicle_response.dart';
import 'history_ride_waypoint_response.dart';

part 'ride_history_response.g.dart';

@JsonSerializable()
class RideHistoryResponse {
  double? distance;
  HistoryRideDriverResponse? driver;
  @JsonKey(name: 'driver_current_latitude')
  double? driverCurrentLatitude;
  @JsonKey(name: 'driver_current_longitude')
  double? driverCurrentLongitude;
  int? duration;
  @JsonKey(name: 'encoded_polyline')
  String? encodedPolyline;
  @JsonKey(name: 'end_address')
  String? endAddress;
  @JsonKey(name: 'end_latitude')
  double? endLatitude;
  @JsonKey(name: 'end_longitude')
  double? endLongitude;
  @JsonKey(name: 'end_time')
  String? endTime;
  int? fare;
  HistoryRideHitcherResponse? hitcher;
  @JsonKey(name: 'ride_id')
  String? rideId;
  @JsonKey(name: 'ride_offer_id')
  String? rideOfferId;
  @JsonKey(name: 'ride_request_id')
  String? rideRequestId;
  @JsonKey(name: 'rider_current_latitude')
  double? riderCurrentLatitude;
  @JsonKey(name: 'rider_current_longitude')
  double? riderCurrentLongitude;
  @JsonKey(name: 'start_address')
  String? startAddress;
  @JsonKey(name: 'start_latitude')
  double? startLatitude;
  @JsonKey(name: 'start_longitude')
  double? startLongitude;
  @JsonKey(name: 'start_time')
  String? startTime;
  String? status;
  HistoryRideTransactionResponse? transaction;
  HistoryRideVehicleResponse? vehicle;
  List<HistoryRideWaypointResponse>? waypoints;

  RideHistoryResponse({
    this.distance,
    this.driver,
    this.driverCurrentLatitude,
    this.driverCurrentLongitude,
    this.duration,
    this.encodedPolyline,
    this.endAddress,
    this.endLatitude,
    this.endLongitude,
    this.endTime,
    this.fare,
    this.hitcher,
    this.rideId,
    this.rideOfferId,
    this.rideRequestId,
    this.riderCurrentLatitude,
    this.riderCurrentLongitude,
    this.startAddress,
    this.startLatitude,
    this.startLongitude,
    this.startTime,
    this.status,
    this.transaction,
    this.vehicle,
    this.waypoints,
  });

  factory RideHistoryResponse.fromJson(Map<String, dynamic> json) {
    return _$RideHistoryResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RideHistoryResponseToJson(this);
}
