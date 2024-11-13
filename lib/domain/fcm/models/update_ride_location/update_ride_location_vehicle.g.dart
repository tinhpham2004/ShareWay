// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_ride_location_vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRideLocationVehicle _$UpdateRideLocationVehicleFromJson(
        Map<String, dynamic> json) =>
    UpdateRideLocationVehicle(
      vehicleId: json['vehicle_id'] as String?,
      name: json['name'] as String?,
      fuelConsumed: (json['fuel_consumed'] as num?)?.toInt(),
      licensePlate: json['license_plate'] as String?,
    );

Map<String, dynamic> _$UpdateRideLocationVehicleToJson(
        UpdateRideLocationVehicle instance) =>
    <String, dynamic>{
      'vehicle_id': instance.vehicleId,
      'name': instance.name,
      'fuel_consumed': instance.fuelConsumed,
      'license_plate': instance.licensePlate,
    };
