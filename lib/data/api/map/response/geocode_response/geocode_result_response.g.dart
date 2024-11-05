// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocode_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodeResultResponse _$GeocodeResultResponseFromJson(
        Map<String, dynamic> json) =>
    GeocodeResultResponse(
      distance: (json['distance'] as num?)?.toDouble(),
      formattedAddress: json['formatted_address'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      mainAddress: json['main_address'] as String?,
      placeId: json['place_id'] as String?,
      secondaryAddress: json['secondary_address'] as String?,
    );

Map<String, dynamic> _$GeocodeResultResponseToJson(
        GeocodeResultResponse instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'formatted_address': instance.formattedAddress,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'main_address': instance.mainAddress,
      'place_id': instance.placeId,
      'secondary_address': instance.secondaryAddress,
    };
