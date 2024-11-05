// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocode_current_location_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodeCurrentLocationRequest _$GeocodeCurrentLocationRequestFromJson(
        Map<String, dynamic> json) =>
    GeocodeCurrentLocationRequest(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GeocodeCurrentLocationRequestToJson(
        GeocodeCurrentLocationRequest instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
