import 'package:json_annotation/json_annotation.dart';

import 'pending_ride_user_response.dart';

part 'pending_ride_request_response.g.dart';

@JsonSerializable()
class PendingRideRequestResponse {
  @JsonKey(name: 'ride_request_id')
  String? rideRequestId;
  PendingRideUserResponse? user;
  @JsonKey(name: 'start_latitude')
  double? startLatitude;
  @JsonKey(name: 'start_longitude')
  double? startLongitude;
  @JsonKey(name: 'end_latitude')
  double? endLatitude;
  @JsonKey(name: 'end_longitude')
  double? endLongitude;
  @JsonKey(name: 'rider_current_latitude')
  double? riderCurrentLatitude;
  @JsonKey(name: 'rider_current_longitude')
  double? riderCurrentLongitude;
  @JsonKey(name: 'start_address')
  String? startAddress;
  @JsonKey(name: 'end_address')
  String? endAddress;
  String? status;
  @JsonKey(name: 'encoded_polyline')
  String? encodedPolyline;
  int? distance;
  int? duration;
  @JsonKey(name: 'start_time')
  String? startTime;
  @JsonKey(name: 'end_time')
  String? endTime;

  PendingRideRequestResponse({
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
  });

  factory PendingRideRequestResponse.fromJson(Map<String, dynamic> json) {
    return _$PendingRideRequestResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PendingRideRequestResponseToJson(this);
}
