import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'accept_ride_request_transaction.dart';
import 'accept_ride_request_vehicle.dart';

part 'accept_ride_request_data.g.dart';

@JsonSerializable()
class AcceptRideRequestData {
  @JsonKey(name: 'ride_id')
  String? rideId;
  @JsonKey(name: 'ride_offer_id')
  String? rideOfferId;
  @JsonKey(name: 'ride_request_id')
  String? rideRequestId;
  @JsonKey(name: 'receiver_id')
  String? receiverId;
  String? status;
  @JsonKey(name: 'start_time', fromJson: _dateTimeFromString)
  DateTime? startTime;
  @JsonKey(name: 'end_time', fromJson: _dateTimeFromString)
  DateTime? endTime;
  @JsonKey(name: 'start_address')
  String? startAddress;
  @JsonKey(name: 'end_address')
  String? endAddress;
  @JsonKey(name: 'fare', fromJson: _doubleFromString)
  double? fare;
  @JsonKey(name: 'encoded_polyline')
  String? encodedPolyline;
  @JsonKey(name: 'distance', fromJson: _doubleFromString)
  double? distance;
  @JsonKey(name: 'duration', fromJson: _intFromString)
  int? duration;
  @JsonKey(name: 'transaction', fromJson: _transactionFromJson)
  AcceptRideRequestTransaction? transaction;
  @JsonKey(name: 'start_latitude', fromJson: _doubleFromString)
  double? startLatitude;
  @JsonKey(name: 'start_longitude', fromJson: _doubleFromString)
  double? startLongitude;
  @JsonKey(name: 'end_latitude', fromJson: _doubleFromString)
  double? endLatitude;
  @JsonKey(name: 'end_longitude', fromJson: _doubleFromString)
  double? endLongitude;
  @JsonKey(name: 'driver_latitude', fromJson: _doubleFromString)
  double? driverLatitude;
  @JsonKey(name: 'driver_longitude', fromJson: _doubleFromString)
  double? driverLongitude;
  @JsonKey(name: 'rider_latitude', fromJson: _doubleFromString)
  double? riderLatitude;
  @JsonKey(name: 'rider_longitude', fromJson: _doubleFromString)
  double? riderLongitude;
  @JsonKey(name: 'vehicle', fromJson: _vehicleFromJson)
  AcceptRideRequestVehicle? vehicle;

  AcceptRideRequestData({
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
    this.startLatitude,
    this.startLongitude,
    this.endLatitude,
    this.endLongitude,
    this.vehicle,
  });

  factory AcceptRideRequestData.fromJson(Map<String, dynamic> json) =>
      _$AcceptRideRequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$AcceptRideRequestDataToJson(this);

  static double? _doubleFromString(String? value) =>
      value != null ? double.tryParse(value) : null;

  static int? _intFromString(String? value) =>
      value != null ? int.tryParse(value) : null;

  static DateTime? _dateTimeFromString(String? value) =>
      value != null ? DateTime.tryParse(value) : null;

  static AcceptRideRequestTransaction? _transactionFromJson(String? value) =>
      value != null
          ? AcceptRideRequestTransaction.fromJson(jsonDecode(value))
          : null;

  static AcceptRideRequestVehicle? _vehicleFromJson(String? value) =>
      value != null
          ? AcceptRideRequestVehicle.fromJson(jsonDecode(value))
          : null;
}
