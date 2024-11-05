// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocode_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodeRequest _$GeocodeRequestFromJson(Map<String, dynamic> json) =>
    GeocodeRequest(
      currentLocation: json['current_location'] == null
          ? null
          : GeocodeCurrentLocationRequest.fromJson(
              json['current_location'] as Map<String, dynamic>),
      point: json['point'] == null
          ? null
          : GeocodePointRequest.fromJson(json['point'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeocodeRequestToJson(GeocodeRequest instance) =>
    <String, dynamic>{
      'current_location': instance.currentLocation,
      'point': instance.point,
    };
