// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleItemResponse _$VehicleItemResponseFromJson(Map<String, dynamic> json) =>
    VehicleItemResponse(
      vehicleId: json['vehicle_id'] as String?,
      name: json['name'] as String?,
      fuelConsumed: (json['fuel_consumed'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VehicleItemResponseToJson(
        VehicleItemResponse instance) =>
    <String, dynamic>{
      'vehicle_id': instance.vehicleId,
      'name': instance.name,
      'fuel_consumed': instance.fuelConsumed,
    };
