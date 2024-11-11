// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_give_ride_request_vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewGiveRideRequestVehicle _$NewGiveRideRequestVehicleFromJson(
        Map<String, dynamic> json) =>
    NewGiveRideRequestVehicle(
      vehicleId: json['vehicle_id'] as String?,
      name: json['name'] as String?,
      fuelConsumed: (json['fuel_consumed'] as num?)?.toDouble(),
      licensePlate: json['license_plate'] as String?,
    );

Map<String, dynamic> _$NewGiveRideRequestVehicleToJson(
        NewGiveRideRequestVehicle instance) =>
    <String, dynamic>{
      'vehicle_id': instance.vehicleId,
      'name': instance.name,
      'fuel_consumed': instance.fuelConsumed,
      'license_plate': instance.licensePlate,
    };
