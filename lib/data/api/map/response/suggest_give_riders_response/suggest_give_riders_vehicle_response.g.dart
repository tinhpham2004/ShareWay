// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_give_riders_vehicle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestGiveRidersVehicleResponse _$SuggestGiveRidersVehicleResponseFromJson(
        Map<String, dynamic> json) =>
    SuggestGiveRidersVehicleResponse(
      fuelConsumed: (json['fuel_consumed'] as num?)?.toDouble(),
      licensePlate: json['license_plate'] as String?,
      name: json['name'] as String?,
      vehicleId: json['vehicle_id'] as String?,
    );

Map<String, dynamic> _$SuggestGiveRidersVehicleResponseToJson(
        SuggestGiveRidersVehicleResponse instance) =>
    <String, dynamic>{
      'fuel_consumed': instance.fuelConsumed,
      'license_plate': instance.licensePlate,
      'name': instance.name,
      'vehicle_id': instance.vehicleId,
    };
