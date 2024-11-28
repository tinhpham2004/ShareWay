// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_ride_waypoint_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingRideWaypointResponse _$PendingRideWaypointResponseFromJson(
        Map<String, dynamic> json) =>
    PendingRideWaypointResponse(
      waypointId: json['waypoint_id'] as String?,
      lattitude: (json['lattitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      address: json['address'] as String?,
      order: (json['order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PendingRideWaypointResponseToJson(
        PendingRideWaypointResponse instance) =>
    <String, dynamic>{
      'waypoint_id': instance.waypointId,
      'lattitude': instance.lattitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'order': instance.order,
    };
