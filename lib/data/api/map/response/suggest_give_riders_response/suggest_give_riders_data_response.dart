import 'package:json_annotation/json_annotation.dart';

import 'suggest_give_riders_ride_offer_response.dart';

part 'suggest_give_riders_data_response.g.dart';

@JsonSerializable()
class SuggestGiveRidersDataResponse {
  @JsonKey(name: 'ride_offers')
  List<SuggestGiveRidersRideOfferResponse>? rideOffers;

  SuggestGiveRidersDataResponse({this.rideOffers});

  factory SuggestGiveRidersDataResponse.fromJson(Map<String, dynamic> json) =>
      _$SuggestGiveRidersDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestGiveRidersDataResponseToJson(this);
}
