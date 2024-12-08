import 'dart:convert';
import 'package:share_way_frontend/domain/fcm/models/new_hitch_ride_request/new_hitch_ride_request_vehicle.dart';

import 'package:json_annotation/json_annotation.dart';
import 'new_hitch_ride_request_user.dart';

part 'new_hitch_ride_request_data.g.dart';

@JsonSerializable()
class NewHitchRideRequestData {
  @JsonKey(name: 'ride_request_id')
  String? rideRequestId;

  @JsonKey(name: 'ride_offer_id')
  String? rideOfferId;

  @JsonKey(name: 'user', fromJson: _userFromJson)
  NewHitchRideRequestUser? user;

  @JsonKey(name: 'start_latitude', fromJson: _doubleFromString)
  double? startLatitude;

  @JsonKey(name: 'start_longitude', fromJson: _doubleFromString)
  double? startLongitude;

  @JsonKey(name: 'end_latitude', fromJson: _doubleFromString)
  double? endLatitude;

  @JsonKey(name: 'end_longitude', fromJson: _doubleFromString)
  double? endLongitude;

  @JsonKey(name: 'rider_current_latitude', fromJson: _doubleFromString)
  double? riderCurrentLatitude;

  @JsonKey(name: 'rider_current_longitude', fromJson: _doubleFromString)
  double? riderCurrentLongitude;

  @JsonKey(name: 'start_address')
  String? startAddress;

  @JsonKey(name: 'end_address')
  String? endAddress;

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'encoded_polyline')
  String? encodedPolyline;

  @JsonKey(name: 'distance', fromJson: _doubleFromString)
  double? distance;

  @JsonKey(name: 'duration', fromJson: _intFromString)
  int? duration;

  @JsonKey(name: 'start_time', fromJson: _dateTimeFromString)
  DateTime? startTime;

  @JsonKey(name: 'end_time', fromJson: _dateTimeFromString)
  DateTime? endTime;

  @JsonKey(name: 'vehicle', fromJson: _vehicleFromJson)
  NewHitchRideRequestVehicle? vehicle;

  NewHitchRideRequestData({
    this.rideOfferId,
    this.rideRequestId,
    this.user,
    this.startLatitude,
    this.startLongitude,
    this.endLatitude,
    this.endLongitude,
    this.riderCurrentLatitude,
    this.riderCurrentLongitude,
    this.startAddress,
    this.endAddress,
    this.status,
    this.encodedPolyline,
    this.distance,
    this.duration,
    this.startTime,
    this.endTime,
    this.vehicle,
  });

  /// Factory constructor to parse JSON string from the backend
  factory NewHitchRideRequestData.fromJson(Map<String, dynamic> json) =>
      _$NewHitchRideRequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$NewHitchRideRequestDataToJson(this);

  // Custom converters
  static double? _doubleFromString(dynamic value) =>
      value != null ? double.tryParse(value.toString()) : null;

  static int? _intFromString(dynamic value) =>
      value != null ? int.tryParse(value.toString()) : null;

  static DateTime? _dateTimeFromString(String? value) =>
      value != null ? DateTime.tryParse(value) : null;

  static NewHitchRideRequestUser? _userFromJson(dynamic value) => value != null
      ? (value.runtimeType == String
          ? NewHitchRideRequestUser.fromJson(jsonDecode(value))
          : NewHitchRideRequestUser.fromJson(value))
      : null;

  static NewHitchRideRequestVehicle? _vehicleFromJson(dynamic value) =>
      value != null
          ? (value.runtimeType == String
              ? NewHitchRideRequestVehicle.fromJson(jsonDecode(value))
              : NewHitchRideRequestVehicle.fromJson(value))
          : null;
}
