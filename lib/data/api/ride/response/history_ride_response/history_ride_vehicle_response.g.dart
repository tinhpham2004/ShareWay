// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_ride_vehicle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryRideVehicleResponse _$HistoryRideVehicleResponseFromJson(
        Map<String, dynamic> json) =>
    HistoryRideVehicleResponse(
      fuelConsumed: (json['fuel_consumed'] as num?)?.toDouble(),
      licensePlate: json['license_plate'] as String?,
      name: json['name'] as String?,
      vehicleId: json['vehicle_id'] as String?,
    );

Map<String, dynamic> _$HistoryRideVehicleResponseToJson(
        HistoryRideVehicleResponse instance) =>
    <String, dynamic>{
      'fuel_consumed': instance.fuelConsumed,
      'license_plate': instance.licensePlate,
      'name': instance.name,
      'vehicle_id': instance.vehicleId,
    };
