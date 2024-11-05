// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleDataResponse _$VehicleDataResponseFromJson(Map<String, dynamic> json) =>
    VehicleDataResponse(
      vehicles: (json['vehicles'] as List<dynamic>?)
          ?.map((e) => VehicleItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VehicleDataResponseToJson(
        VehicleDataResponse instance) =>
    <String, dynamic>{
      'vehicles': instance.vehicles,
    };
