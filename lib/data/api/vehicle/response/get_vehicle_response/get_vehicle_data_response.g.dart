// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_vehicle_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVehicleDataResponse _$GetVehicleDataResponseFromJson(
        Map<String, dynamic> json) =>
    GetVehicleDataResponse(
      vehicle: (json['vehicle'] as List<dynamic>?)
          ?.map(
              (e) => GetVehicleItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetVehicleDataResponseToJson(
        GetVehicleDataResponse instance) =>
    <String, dynamic>{
      'vehicle': instance.vehicle,
    };
