import 'package:json_annotation/json_annotation.dart';

import 'suggest_hitch_riders_ride_request_response.dart';

part 'suggest_hitch_riders_data_response.g.dart';

@JsonSerializable()
class SuggestHitchRidersDataResponse {
  @JsonKey(name: 'ride_requests')
  List<SuggestHitchRidersRideRequestResponse>? rideRequests;

  SuggestHitchRidersDataResponse({this.rideRequests});

  factory SuggestHitchRidersDataResponse.fromJson(Map<String, dynamic> json) => _$SuggestHitchRidersDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestHitchRidersDataResponseToJson(this);
}
