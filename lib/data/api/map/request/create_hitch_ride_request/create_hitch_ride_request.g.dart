// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_hitch_ride_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateHitchRideRequest _$CreateHitchRideRequestFromJson(
        Map<String, dynamic> json) =>
    CreateHitchRideRequest(
      placeList: (json['place_list'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
    );

Map<String, dynamic> _$CreateHitchRideRequestToJson(
        CreateHitchRideRequest instance) =>
    <String, dynamic>{
      'place_list': instance.placeList,
      'start_time': instance.startTime?.toIso8601String(),
    };
