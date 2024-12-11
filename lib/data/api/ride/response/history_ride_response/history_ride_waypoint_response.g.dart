// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_ride_waypoint_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryRideWaypointResponse _$HistoryRideWaypointResponseFromJson(
        Map<String, dynamic> json) =>
    HistoryRideWaypointResponse(
      address: json['address'] as String?,
      lattitude: (json['lattitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      order: (json['order'] as num?)?.toInt(),
      waypointId: json['waypoint_id'] as String?,
    );

Map<String, dynamic> _$HistoryRideWaypointResponseToJson(
        HistoryRideWaypointResponse instance) =>
    <String, dynamic>{
      'address': instance.address,
      'lattitude': instance.lattitude,
      'longitude': instance.longitude,
      'order': instance.order,
      'waypoint_id': instance.waypointId,
    };
