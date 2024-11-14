import 'package:json_annotation/json_annotation.dart';

import 'start_ride_transaction.dart';
import 'start_ride_vehicle.dart';

part 'start_ride_data.g.dart';

@JsonSerializable()
class StartRideData {
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
  StartRideTransaction? transaction;
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
  StartRidevehicle? vehicle;

  StartRideData({
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

  factory StartRideData.fromJson(Map<String, dynamic> json) =>
      _$StartRideDataFromJson(json);

  Map<String, dynamic> toJson() => _$StartRideDataToJson(this);
}
