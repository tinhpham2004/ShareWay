// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_ride.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartRide _$StartRideFromJson(Map<String, dynamic> json) => StartRide(
      type: json['type'] as String?,
      data: json['data'] == null
          ? null
          : StartRideData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StartRideToJson(StartRide instance) => <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
    };
