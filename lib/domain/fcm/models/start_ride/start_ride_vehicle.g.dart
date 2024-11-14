// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_ride_vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartRidevehicle _$StartRidevehicleFromJson(Map<String, dynamic> json) =>
    StartRidevehicle(
      vehicleId: json['vehicle_id'] as String?,
      name: json['name'] as String?,
      fuelConsumed: (json['fuel_consumed'] as num?)?.toDouble(),
      licensePlate: json['license_plate'] as String?,
    );

Map<String, dynamic> _$StartRidevehicleToJson(StartRidevehicle instance) =>
    <String, dynamic>{
      'vehicle_id': instance.vehicleId,
      'name': instance.name,
      'fuel_consumed': instance.fuelConsumed,
      'license_plate': instance.licensePlate,
    };
