// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_give_ride_step_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGiveRideStepResponse _$CreateGiveRideStepResponseFromJson(
        Map<String, dynamic> json) =>
    CreateGiveRideStepResponse(
      distance: json['distance'] == null
          ? null
          : CreateGiveRideDistanceResponse.fromJson(
              json['distance'] as Map<String, dynamic>),
      duration: json['duration'] == null
          ? null
          : CreateGiveRideDurationResponse.fromJson(
              json['duration'] as Map<String, dynamic>),
      endLocation: json['end_location'] == null
          ? null
          : CreateGiveRideEndLocationResponse.fromJson(
              json['end_location'] as Map<String, dynamic>),
      htmlInstructions: json['html_instructions'] as String?,
      maneuver: json['maneuver'] as String?,
      polyline: json['polyline'] == null
          ? null
          : CreateGiveRidePolylineResponse.fromJson(
              json['polyline'] as Map<String, dynamic>),
      startLocation: json['start_location'] == null
          ? null
          : CreateGiveRideStartLocationResponse.fromJson(
              json['start_location'] as Map<String, dynamic>),
      travelMode: json['travel_mode'] as String?,
    );

Map<String, dynamic> _$CreateGiveRideStepResponseToJson(
        CreateGiveRideStepResponse instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
      'end_location': instance.endLocation,
      'html_instructions': instance.htmlInstructions,
      'maneuver': instance.maneuver,
      'polyline': instance.polyline,
      'start_location': instance.startLocation,
      'travel_mode': instance.travelMode,
    };
