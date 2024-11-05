// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_give_ride_leg_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGiveRideLegResponse _$CreateGiveRideLegResponseFromJson(
        Map<String, dynamic> json) =>
    CreateGiveRideLegResponse(
      distance: json['distance'] == null
          ? null
          : CreateGiveRideDistanceResponse.fromJson(
              json['distance'] as Map<String, dynamic>),
      duration: json['duration'] == null
          ? null
          : CreateGiveRideDurationResponse.fromJson(
              json['duration'] as Map<String, dynamic>),
      endAddress: json['end_address'] as String?,
      startAddress: json['start_address'] as String?,
      endLocation: json['end_location'] == null
          ? null
          : CreateGiveRideEndLocationResponse.fromJson(
              json['end_location'] as Map<String, dynamic>),
      startLocation: json['start_location'] == null
          ? null
          : CreateGiveRideStartLocationResponse.fromJson(
              json['start_location'] as Map<String, dynamic>),
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) =>
              CreateGiveRideStepResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateGiveRideLegResponseToJson(
        CreateGiveRideLegResponse instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
      'end_address': instance.endAddress,
      'start_address': instance.startAddress,
      'end_location': instance.endLocation,
      'start_location': instance.startLocation,
      'steps': instance.steps,
    };
