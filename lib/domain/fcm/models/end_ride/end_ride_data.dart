import 'package:json_annotation/json_annotation.dart';

import 'end_ride_transaction.dart';
import 'end_ride_vehicle.dart';

part 'end_ride_data.g.dart';

@JsonSerializable()
class EndRideData {
  @JsonKey(name: 'ride_id')
  String? rideId;
  @JsonKey(name: 'ride_offer_id')
  String? rideOfferId;
  @JsonKey(name: 'ride_request_id')
  String? rideRequestId;
  @JsonKey(name: 'receiver_id')
  String? receiverId;
  String? status;
  @JsonKey(name: 'start_time')
  DateTime? startTime;
  @JsonKey(name: 'end_time')
  DateTime? endTime;
  @JsonKey(name: 'start_address')
  String? startAddress;
  @JsonKey(name: 'end_address')
  String? endAddress;
  double? fare;
  @JsonKey(name: 'encoded_polyline')
  String? encodedPolyline;
  double? distance;
  int? duration;
  EndRideTransaction? transaction;
  @JsonKey(name: 'driver_current_latitude')
  double? driverCurrentLatitude;
  @JsonKey(name: 'driver_current_longitude')
  double? driverCurrentLongitude;
  @JsonKey(name: 'rider_current_latitude')
  double? riderCurrentLatitude;
  @JsonKey(name: 'rider_current_longitude')
  double? riderCurrentLongitude;
  @JsonKey(name: 'start_latitude')
  double? startLatitude;
  @JsonKey(name: 'start_longitude')
  double? startLongitude;
  @JsonKey(name: 'end_latitude')
  double? endLatitude;
  @JsonKey(name: 'end_longitude')
  double? endLongitude;
  EndRideVehicle? vehicle;

  EndRideData({
    this.rideId,
    this.rideOfferId,
    this.rideRequestId,
    this.receiverId,
    this.status,
    this.startTime,
    this.endTime,
    this.startAddress,
    this.endAddress,
    this.fare,
    this.encodedPolyline,
    this.distance,
    this.duration,
    this.transaction,
    this.driverCurrentLatitude,
    this.driverCurrentLongitude,
    this.riderCurrentLatitude,
    this.riderCurrentLongitude,
    this.startLatitude,
    this.startLongitude,
    this.endLatitude,
    this.endLongitude,
    this.vehicle,
  });

  factory EndRideData.fromJson(Map<String, dynamic> json) =>
      _$EndRideDataFromJson(json);

  Map<String, dynamic> toJson() => _$EndRideDataToJson(this);
}
