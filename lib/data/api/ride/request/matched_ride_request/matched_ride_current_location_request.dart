import 'package:json_annotation/json_annotation.dart';

part 'matched_ride_current_location_request.g.dart';

@JsonSerializable()
class MatchedRideCurrentLocationRequest {
  double? lat;
  double? lng;

  MatchedRideCurrentLocationRequest({this.lat, this.lng});

  factory MatchedRideCurrentLocationRequest.fromJson(
      Map<String, dynamic> json) {
    return _$MatchedRideCurrentLocationRequestFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$MatchedRideCurrentLocationRequestToJson(this);
}
