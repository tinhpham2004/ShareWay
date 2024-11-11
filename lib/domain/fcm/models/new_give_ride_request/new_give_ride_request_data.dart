import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'new_give_ride_request_user.dart';
import 'new_give_ride_request_vehicle.dart';

part 'new_give_ride_request_data.g.dart';

@JsonSerializable()
class NewGiveRideRequestData {
  @JsonKey(name: 'ride_offer_id')
  String? rideOfferId;
  @JsonKey(name: 'ride_request_id')
  String? rideRequestId;
  @JsonKey(name: 'receiver_id')
  String? receiverId;
  @JsonKey(name: 'user', fromJson: _userFromJson)
  NewGiveRideRequestUser? user;
  @JsonKey(name: 'vehicle', fromJson: _vehicleFromJson)
  NewGiveRideRequestVehicle? vehicle;
  @JsonKey(name: 'start_latitude', fromJson: _doubleFromString)
  double? startLatitude;
  @JsonKey(name: 'start_longitude', fromJson: _doubleFromString)
  double? startLongitude;
  @JsonKey(name: 'end_latitude', fromJson: _doubleFromString)
  double? endLatitude;
  @JsonKey(name: 'end_longitude', fromJson: _doubleFromString)
  double? endLongitude;
  @JsonKey(name: 'start_address')
  String? startAddress;
  @JsonKey(name: 'end_address')
  String? endAddress;
  @JsonKey(name: 'encoded_polyline')
  String? encodedPolyline;
  @JsonKey(name: 'distance', fromJson: _doubleFromString)
  double? distance;
  @JsonKey(name: 'duration', fromJson: _intFromString)
  int? duration;
  @JsonKey(name: 'driver_current_latitude', fromJson: _doubleFromString)
  double? driverCurrentLatitude;
  @JsonKey(name: 'driver_current_longitude', fromJson: _doubleFromString)
  double? driverCurrentLongitude;
  @JsonKey(name: 'start_time', fromJson: _dateTimeFromString)
  DateTime? startTime;
  @JsonKey(name: 'end_time', fromJson: _dateTimeFromString)
  DateTime? endTime;
  String? status;
  @JsonKey(name: 'fare', fromJson: _doubleFromString)
  double? fare;

  NewGiveRideRequestData({
    this.rideOfferId,
    this.rideRequestId,
    this.receiverId,
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

  factory NewGiveRideRequestData.fromJson(Map<String, dynamic> json) => _$NewGiveRideRequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$NewGiveRideRequestDataToJson(this);

    static double? _doubleFromString(String? value) =>
      value != null ? double.tryParse(value) : null;

  static int? _intFromString(String? value) =>
      value != null ? int.tryParse(value) : null;

  static DateTime? _dateTimeFromString(String? value) =>
      value != null ? DateTime.tryParse(value) : null;

  static NewGiveRideRequestUser? _userFromJson(String? value) => value != null
      ? NewGiveRideRequestUser.fromJson(jsonDecode(value))
      : null;

  static NewGiveRideRequestVehicle? _vehicleFromJson(String? value) =>
      value != null
          ? NewGiveRideRequestVehicle.fromJson(jsonDecode(value))
          : null;
}
