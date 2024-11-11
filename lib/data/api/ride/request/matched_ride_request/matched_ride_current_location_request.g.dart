// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matched_ride_current_location_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchedRideCurrentLocationRequest _$MatchedRideCurrentLocationRequestFromJson(
        Map<String, dynamic> json) =>
    MatchedRideCurrentLocationRequest(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MatchedRideCurrentLocationRequestToJson(
        MatchedRideCurrentLocationRequest instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
