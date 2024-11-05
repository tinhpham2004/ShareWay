// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_prediction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutocompletePredictionResponse _$AutocompletePredictionResponseFromJson(
        Map<String, dynamic> json) =>
    AutocompletePredictionResponse(
      description: json['description'] as String?,
      matchedSubstrings: json['matched_substrings'] as List<dynamic>?,
      placeId: json['place_id'] as String?,
      reference: json['reference'] as String?,
      structuredFormatting: json['structured_formatting'] == null
          ? null
          : AutocompleteStructuredFormattingResponse.fromJson(
              json['structured_formatting'] as Map<String, dynamic>),
      terms: (json['terms'] as List<dynamic>?)
          ?.map((e) =>
              AutocompleteTermResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasChildren: json['has_children'] as bool?,
      displayType: json['display_type'] as String?,
      score: (json['score'] as num?)?.toInt(),
      plusCode: json['plus_code'] == null
          ? null
          : AutocompletePlusCodeResponse.fromJson(
              json['plus_code'] as Map<String, dynamic>),
      distance: (json['distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AutocompletePredictionResponseToJson(
        AutocompletePredictionResponse instance) =>
    <String, dynamic>{
      'description': instance.description,
      'matched_substrings': instance.matchedSubstrings,
      'place_id': instance.placeId,
      'reference': instance.reference,
      'structured_formatting': instance.structuredFormatting,
      'terms': instance.terms,
      'has_children': instance.hasChildren,
      'display_type': instance.displayType,
      'score': instance.score,
      'plus_code': instance.plusCode,
      'distance': instance.distance,
    };
