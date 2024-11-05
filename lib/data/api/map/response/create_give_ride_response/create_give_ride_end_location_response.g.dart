// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_give_ride_end_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGiveRideEndLocationResponse _$CreateGiveRideEndLocationResponseFromJson(
        Map<String, dynamic> json) =>
    CreateGiveRideEndLocationResponse(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CreateGiveRideEndLocationResponseToJson(
        CreateGiveRideEndLocationResponse instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
