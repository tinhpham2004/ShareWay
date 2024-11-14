// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'end_ride_vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EndRideVehicle _$EndRideVehicleFromJson(Map<String, dynamic> json) =>
    EndRideVehicle(
      vehicleId: json['vehicle_id'] as String?,
      name: json['name'] as String?,
      fuelConsumed: (json['fuel_consumed'] as num?)?.toDouble(),
      licensePlate: json['license_plate'] as String?,
    );

Map<String, dynamic> _$EndRideVehicleToJson(EndRideVehicle instance) =>
    <String, dynamic>{
      'vehicle_id': instance.vehicleId,
      'name': instance.name,
      'fuel_consumed': instance.fuelConsumed,
      'license_plate': instance.licensePlate,
    };
