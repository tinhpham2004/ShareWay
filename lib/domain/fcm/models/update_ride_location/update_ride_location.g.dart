// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_ride_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRideLocation _$UpdateRideLocationFromJson(Map<String, dynamic> json) =>
    UpdateRideLocation(
      type: json['type'] as String?,
      data: json['data'] == null
          ? null
          : UpdateRideLocationData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateRideLocationToJson(UpdateRideLocation instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
    };
