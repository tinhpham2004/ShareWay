import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/domain/fcm/models/accept_ride_request/accept_ride_request_user.dart';

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
  @JsonKey(name: 'user', fromJson: _userFromJson)
  AcceptRideRequestUser? user;
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
    this.user,
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

  static double? _doubleFromString(dynamic value) =>
      value != null ? double.tryParse(value.toString()) : null;

  static int? _intFromString(dynamic value) =>
      value != null ? int.tryParse(value.toString()) : null;

  static DateTime? _dateTimeFromString(String? value) =>
      value != null ? DateTime.tryParse(value) : null;

  static AcceptRideRequestTransaction? _transactionFromJson(dynamic value) =>
      value != null
          ? (value.runtimeType == String
              ? AcceptRideRequestTransaction.fromJson(jsonDecode(value))
              : AcceptRideRequestTransaction.fromJson(value))
          : null;

  static AcceptRideRequestVehicle? _vehicleFromJson(dynamic value) =>
      value != null
          ? (value.runtimeType == String
              ? AcceptRideRequestVehicle.fromJson(jsonDecode(value))
              : AcceptRideRequestVehicle.fromJson(value))
          : null;

  static AcceptRideRequestUser? _userFromJson(dynamic value) => value != null
      ? (value.runtimeType == String
          ? AcceptRideRequestUser.fromJson(jsonDecode(value))
          : AcceptRideRequestUser.fromJson(value))
      : null;
}
