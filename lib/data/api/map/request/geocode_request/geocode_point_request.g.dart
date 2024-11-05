// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocode_point_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodePointRequest _$GeocodePointRequestFromJson(Map<String, dynamic> json) =>
    GeocodePointRequest(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GeocodePointRequestToJson(
        GeocodePointRequest instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
