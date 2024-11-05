// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_give_ride_geocoded_waypoint_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGiveRideGeocodedWaypointResponse
    _$CreateGiveRideGeocodedWaypointResponseFromJson(
            Map<String, dynamic> json) =>
        CreateGiveRideGeocodedWaypointResponse(
          geocoderStatus: json['geocoder_status'] as String?,
          placeId: json['place_id'] as String?,
        );

Map<String, dynamic> _$CreateGiveRideGeocodedWaypointResponseToJson(
        CreateGiveRideGeocodedWaypointResponse instance) =>
    <String, dynamic>{
      'geocoder_status': instance.geocoderStatus,
      'place_id': instance.placeId,
    };
