// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_give_ride_route_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGiveRideRouteResponse _$CreateGiveRideRouteResponseFromJson(
        Map<String, dynamic> json) =>
    CreateGiveRideRouteResponse(
      geocodedWaypoints: (json['geocoded_waypoints'] as List<dynamic>?)
          ?.map((e) => CreateGiveRideGeocodedWaypointResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) =>
              CreateGiveRideRoutesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateGiveRideRouteResponseToJson(
        CreateGiveRideRouteResponse instance) =>
    <String, dynamic>{
      'geocoded_waypoints': instance.geocodedWaypoints,
      'routes': instance.routes,
    };
