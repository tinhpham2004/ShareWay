// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_give_ride_vehicle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGiveRideVehicleResponse _$CreateGiveRideVehicleResponseFromJson(
        Map<String, dynamic> json) =>
    CreateGiveRideVehicleResponse(
      vehicleId: json['vehicle_id'] as String?,
      name: json['name'] as String?,
      fuelConsumed: (json['fuel_consumed'] as num?)?.toDouble(),
      licensePlate: json['license_plate'] as String?,
    );

Map<String, dynamic> _$CreateGiveRideVehicleResponseToJson(
        CreateGiveRideVehicleResponse instance) =>
    <String, dynamic>{
      'vehicle_id': instance.vehicleId,
      'name': instance.name,
      'fuel_consumed': instance.fuelConsumed,
      'license_plate': instance.licensePlate,
    };
