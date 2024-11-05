// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocode_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodeDataResponse _$GeocodeDataResponseFromJson(Map<String, dynamic> json) =>
    GeocodeDataResponse(
      results: (json['results'] as List<dynamic>?)
          ?.map(
              (e) => GeocodeResultResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GeocodeDataResponseToJson(
        GeocodeDataResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
