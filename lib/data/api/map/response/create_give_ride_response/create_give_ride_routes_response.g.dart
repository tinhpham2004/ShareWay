// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_give_ride_routes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGiveRideRoutesResponse _$CreateGiveRideRoutesResponseFromJson(
        Map<String, dynamic> json) =>
    CreateGiveRideRoutesResponse(
      legs: (json['legs'] as List<dynamic>?)
          ?.map((e) =>
              CreateGiveRideLegResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      overviewPolyline: json['overview_polyline'] == null
          ? null
          : CreateGiveRidePolylineResponse.fromJson(
              json['overview_polyline'] as Map<String, dynamic>),
      summary: json['summary'] as String?,
    );

Map<String, dynamic> _$CreateGiveRideRoutesResponseToJson(
        CreateGiveRideRoutesResponse instance) =>
    <String, dynamic>{
      'legs': instance.legs,
      'overview_polyline': instance.overviewPolyline,
      'summary': instance.summary,
    };
