// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_give_ride_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGiveRideRequest _$CreateGiveRideRequestFromJson(
        Map<String, dynamic> json) =>
    CreateGiveRideRequest(
      placeList: (json['place_list'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      vehicleId: json['vehicle_id'] as String?,
    );

Map<String, dynamic> _$CreateGiveRideRequestToJson(
        CreateGiveRideRequest instance) =>
    <String, dynamic>{
      'place_list': instance.placeList,
      'start_time': instance.startTime?.toIso8601String(),
      'vehicle_id': instance.vehicleId,
    };
