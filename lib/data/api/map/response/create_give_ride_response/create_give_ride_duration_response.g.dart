// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_give_ride_duration_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGiveRideDurationResponse _$CreateGiveRideDurationResponseFromJson(
        Map<String, dynamic> json) =>
    CreateGiveRideDurationResponse(
      text: json['text'] as String?,
      value: (json['value'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreateGiveRideDurationResponseToJson(
        CreateGiveRideDurationResponse instance) =>
    <String, dynamic>{
      'text': instance.text,
      'value': instance.value,
    };
