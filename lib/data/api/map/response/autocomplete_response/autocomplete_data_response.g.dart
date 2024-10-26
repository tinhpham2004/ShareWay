// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutocompleteDataResponse _$AutocompleteDataResponseFromJson(
        Map<String, dynamic> json) =>
    AutocompleteDataResponse(
      predictions: (json['predictions'] as List<dynamic>?)
          ?.map((e) => AutocompletePredictionResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      executedTime: (json['executed_time'] as num?)?.toInt(),
      executedTimeAll: (json['executed_time_all'] as num?)?.toInt(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$AutocompleteDataResponseToJson(
        AutocompleteDataResponse instance) =>
    <String, dynamic>{
      'predictions': instance.predictions,
      'executed_time': instance.executedTime,
      'executed_time_all': instance.executedTimeAll,
      'status': instance.status,
    };
