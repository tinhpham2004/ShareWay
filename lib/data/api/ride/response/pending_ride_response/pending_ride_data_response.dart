import 'package:json_annotation/json_annotation.dart';

import 'pending_ride_offer_response.dart';
import 'pending_ride_request_response.dart';

part 'pending_ride_data_response.g.dart';

@JsonSerializable()
class PendingRideDataResponse {
  @JsonKey(name: 'pending_ride_request')
  List<PendingRideRequestResponse>? pendingRideRequest;
  @JsonKey(name: 'pending_ride_offer')
  List<PendingRideOfferResponse>? pendingRideOffer;

  PendingRideDataResponse({this.pendingRideRequest, this.pendingRideOffer});

  factory PendingRideDataResponse.fromJson(Map<String, dynamic> json) => _$PendingRideDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PendingRideDataResponseToJson(this);
}
