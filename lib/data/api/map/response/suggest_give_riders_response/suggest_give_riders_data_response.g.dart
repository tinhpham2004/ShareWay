// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_give_riders_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestGiveRidersDataResponse _$SuggestGiveRidersDataResponseFromJson(
        Map<String, dynamic> json) =>
    SuggestGiveRidersDataResponse(
      rideOffers: (json['ride_offers'] as List<dynamic>?)
          ?.map((e) => SuggestGiveRidersRideOfferResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SuggestGiveRidersDataResponseToJson(
        SuggestGiveRidersDataResponse instance) =>
    <String, dynamic>{
      'ride_offers': instance.rideOffers,
    };
