import 'package:json_annotation/json_annotation.dart';

import 'match_ride_transaction_response.dart';
import 'match_ride_user_response.dart';
import 'match_ride_vehicle_response.dart';

part 'match_ride_data_response.g.dart';

@JsonSerializable()
class MatchRideDataResponse {
  double? distance;
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
  double? fare;
  @JsonKey(name: 'receiver_id')
  String? receiverId;
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
  MatchRideTransactionResponse? transaction;
  MatchRideUserResponse? user;
  MatchRideVehicleResponse? vehicle;

  MatchRideDataResponse({
    this.distance,
    this.driverCurrentLatitude,
    this.driverCurrentLongitude,
    this.duration,
    this.encodedPolyline,
    this.endAddress,
    this.endLatitude,
    this.endLongitude,
    this.endTime,
    this.fare,
    this.receiverId,
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
    this.user,
    this.vehicle,
  });

  factory MatchRideDataResponse.fromJson(Map<String, dynamic> json) =>
      _$MatchRideDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MatchRideDataResponseToJson(this);
}
