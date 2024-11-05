// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutocompleteRequest _$AutocompleteRequestFromJson(Map<String, dynamic> json) =>
    AutocompleteRequest(
      input: json['input'] as String,
      limit: (json['limit'] as num?)?.toInt(),
      location: json['location'] as String?,
      moreCompound: json['more_compound'] as bool?,
      currentLocation: json['current_location'] as String?,
    )..radius = (json['radius'] as num?)?.toInt();

Map<String, dynamic> _$AutocompleteRequestToJson(
        AutocompleteRequest instance) =>
    <String, dynamic>{
      'input': instance.input,
      'limit': instance.limit,
      'location': instance.location,
      'radius': instance.radius,
      'more_compound': instance.moreCompound,
      'current_location': instance.currentLocation,
    };
