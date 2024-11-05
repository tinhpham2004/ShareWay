// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_hitch_riders_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestHitchRidersDataResponse _$SuggestHitchRidersDataResponseFromJson(
        Map<String, dynamic> json) =>
    SuggestHitchRidersDataResponse(
      rideRequests: (json['ride_requests'] as List<dynamic>?)
          ?.map((e) => SuggestHitchRidersRideRequestResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SuggestHitchRidersDataResponseToJson(
        SuggestHitchRidersDataResponse instance) =>
    <String, dynamic>{
      'ride_requests': instance.rideRequests,
    };
