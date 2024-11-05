// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicles_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehiclesRequest _$VehiclesRequestFromJson(Map<String, dynamic> json) =>
    VehiclesRequest(
      input: json['input'] as String?,
      limit: (json['limit'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VehiclesRequestToJson(VehiclesRequest instance) =>
    <String, dynamic>{
      'input': instance.input,
      'limit': instance.limit,
      'page': instance.page,
    };
