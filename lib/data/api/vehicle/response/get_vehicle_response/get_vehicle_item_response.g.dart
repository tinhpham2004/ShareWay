// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_vehicle_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVehicleItemResponse _$GetVehicleItemResponseFromJson(
        Map<String, dynamic> json) =>
    GetVehicleItemResponse(
      vehicleId: json['vehicle_id'] as String?,
      name: json['name'] as String?,
      fuelConsumed: (json['fuel_consumed'] as num?)?.toDouble(),
      licensePlate: json['license_plate'] as String?,
    );

Map<String, dynamic> _$GetVehicleItemResponseToJson(
        GetVehicleItemResponse instance) =>
    <String, dynamic>{
      'vehicle_id': instance.vehicleId,
      'name': instance.name,
      'fuel_consumed': instance.fuelConsumed,
      'license_plate': instance.licensePlate,
    };
