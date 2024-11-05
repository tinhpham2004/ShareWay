// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_give_ride_distance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGiveRideDistanceResponse _$CreateGiveRideDistanceResponseFromJson(
        Map<String, dynamic> json) =>
    CreateGiveRideDistanceResponse(
      text: json['text'] as String?,
      value: (json['value'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreateGiveRideDistanceResponseToJson(
        CreateGiveRideDistanceResponse instance) =>
    <String, dynamic>{
      'text': instance.text,
      'value': instance.value,
    };
