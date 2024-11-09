import 'package:json_annotation/json_annotation.dart';

import 'suggest_give_riders_user_response.dart';
import 'suggest_give_riders_vehicle_response.dart';

part 'suggest_give_riders_ride_offer_response.g.dart';

@JsonSerializable()
class SuggestGiveRidersRideOfferResponse {
  int? distance;
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
  DateTime? endTime;
  double? fare;
  @JsonKey(name: 'ride_offer_id')
  String? rideOfferId;
  @JsonKey(name: 'start_address')
  String? startAddress;
  @JsonKey(name: 'start_latitude')
  double? startLatitude;
  @JsonKey(name: 'start_longitude')
  double? startLongitude;
  @JsonKey(name: 'start_time')
  DateTime? startTime;
  String? status;
  SuggestGiveRidersUserResponse? user;
  SuggestGiveRidersVehicleResponse? vehicle;

  SuggestGiveRidersRideOfferResponse({
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
    this.rideOfferId,
    this.startAddress,
    this.startLatitude,
    this.startLongitude,
    this.startTime,
    this.status,
    this.user,
    this.vehicle,
  });

  factory SuggestGiveRidersRideOfferResponse.fromJson(
      Map<String, dynamic> json) {
    return _$SuggestGiveRidersRideOfferResponseFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$SuggestGiveRidersRideOfferResponseToJson(this);
}
