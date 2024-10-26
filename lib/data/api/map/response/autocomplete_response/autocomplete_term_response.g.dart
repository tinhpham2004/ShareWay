// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_term_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutocompleteTermResponse _$AutocompleteTermResponseFromJson(
        Map<String, dynamic> json) =>
    AutocompleteTermResponse(
      offset: (json['offset'] as num?)?.toInt(),
      value: json['value'] as String?,
    );

Map<String, dynamic> _$AutocompleteTermResponseToJson(
        AutocompleteTermResponse instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'value': instance.value,
    };
