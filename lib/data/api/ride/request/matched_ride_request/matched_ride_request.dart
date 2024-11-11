import 'package:json_annotation/json_annotation.dart';
import 'package:share_way_frontend/domain/ride/input/matched_ride_input.dart';

import 'matched_ride_current_location_request.dart';

part 'matched_ride_request.g.dart';

@JsonSerializable()
class MatchedRideRequest {
  MatchedRideCurrentLocationRequest? currentLocation;
  @JsonKey(name: 'rideID')
  String? rideId;

  MatchedRideRequest({this.currentLocation, this.rideId});

  factory MatchedRideRequest.fromJson(Map<String, dynamic> json) {
    return _$MatchedRideRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MatchedRideRequestToJson(this);

  factory MatchedRideRequest.toApiModel(MatchedRideInput input) {
    return MatchedRideRequest(
      currentLocation: MatchedRideCurrentLocationRequest(
        lat: input.currentLocation?.latitude,
        lng: input.currentLocation?.longitude,
      ),
      rideId: input.rideId,
    );
  }
}
