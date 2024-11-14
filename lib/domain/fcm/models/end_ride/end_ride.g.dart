// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'end_ride.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EndRide _$EndRideFromJson(Map<String, dynamic> json) => EndRide(
      type: json['type'] as String?,
      data: json['data'] == null
          ? null
          : EndRideData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EndRideToJson(EndRide instance) => <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
    };
