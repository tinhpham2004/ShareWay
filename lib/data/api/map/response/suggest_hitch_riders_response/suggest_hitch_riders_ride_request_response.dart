import 'package:json_annotation/json_annotation.dart';

import 'suggest_hitch_riders_user_response.dart';

part 'suggest_hitch_riders_ride_request_response.g.dart';

@JsonSerializable()
class SuggestHitchRidersRideRequestResponse {
  double? distance;
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
  DateTime? endTime;
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
  DateTime? startTime;
  String? status;
  SuggestHitchRidersUserResponse? user;

  SuggestHitchRidersRideRequestResponse({
    this.distance,
    this.duration,
    this.encodedPolyline,
    this.endAddress,
    this.endLatitude,
    this.endLongitude,
    this.endTime,
    this.rideRequestId,
    this.riderCurrentLatitude,
    this.riderCurrentLongitude,
    this.startAddress,
    this.startLatitude,
    this.startLongitude,
    this.startTime,
    this.status,
    this.user,
  });

  factory SuggestHitchRidersRideRequestResponse.fromJson(
      Map<String, dynamic> json) {
    return _$SuggestHitchRidersRideRequestResponseFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$SuggestHitchRidersRideRequestResponseToJson(this);
}
