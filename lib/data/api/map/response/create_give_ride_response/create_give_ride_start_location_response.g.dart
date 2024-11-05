// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_give_ride_start_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGiveRideStartLocationResponse
    _$CreateGiveRideStartLocationResponseFromJson(Map<String, dynamic> json) =>
        CreateGiveRideStartLocationResponse(
          lat: (json['lat'] as num?)?.toDouble(),
          lng: (json['lng'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$CreateGiveRideStartLocationResponseToJson(
        CreateGiveRideStartLocationResponse instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
