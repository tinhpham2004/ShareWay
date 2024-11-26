// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_ride_vehicle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingRideVehicleResponse _$PendingRideVehicleResponseFromJson(
        Map<String, dynamic> json) =>
    PendingRideVehicleResponse(
      vehicleId: json['vehicle_id'] as String?,
      name: json['name'] as String?,
      fuelConsumed: (json['fuel_consumed'] as num?)?.toDouble(),
      licensePlate: json['license_plate'] as String?,
    );

Map<String, dynamic> _$PendingRideVehicleResponseToJson(
        PendingRideVehicleResponse instance) =>
    <String, dynamic>{
      'vehicle_id': instance.vehicleId,
      'name': instance.name,
      'fuel_consumed': instance.fuelConsumed,
      'license_plate': instance.licensePlate,
    };
