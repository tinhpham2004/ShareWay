// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_ride_vehicle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchRideVehicleResponse _$MatchRideVehicleResponseFromJson(
        Map<String, dynamic> json) =>
    MatchRideVehicleResponse(
      fuelConsumed: (json['fuel_consumed'] as num?)?.toInt(),
      licensePlate: json['license_plate'] as String?,
      name: json['name'] as String?,
      vehicleId: json['vehicle_id'] as String?,
    );

Map<String, dynamic> _$MatchRideVehicleResponseToJson(
        MatchRideVehicleResponse instance) =>
    <String, dynamic>{
      'fuel_consumed': instance.fuelConsumed,
      'license_plate': instance.licensePlate,
      'name': instance.name,
      'vehicle_id': instance.vehicleId,
    };
