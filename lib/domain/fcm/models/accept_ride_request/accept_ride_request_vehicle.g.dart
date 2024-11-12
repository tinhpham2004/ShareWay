// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_ride_request_vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptRideRequestVehicle _$AcceptRideRequestVehicleFromJson(
        Map<String, dynamic> json) =>
    AcceptRideRequestVehicle(
      vehicleId: json['vehicle_id'] as String?,
      name: json['name'] as String?,
      fuelConsumed: (json['fuel_consumed'] as num?)?.toDouble(),
      licensePlate: json['license_plate'] as String?,
    );

Map<String, dynamic> _$AcceptRideRequestVehicleToJson(
        AcceptRideRequestVehicle instance) =>
    <String, dynamic>{
      'vehicle_id': instance.vehicleId,
      'name': instance.name,
      'fuel_consumed': instance.fuelConsumed,
      'license_plate': instance.licensePlate,
    };
