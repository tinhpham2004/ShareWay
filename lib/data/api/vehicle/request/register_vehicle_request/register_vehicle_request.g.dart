// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_vehicle_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterVehicleRequest _$RegisterVehicleRequestFromJson(
        Map<String, dynamic> json) =>
    RegisterVehicleRequest(
      caVet: json['ca_vet'] as String?,
      licensePlate: json['license_plate'] as String?,
      userId: json['user_id'] as String?,
      vehicleId: json['vehicle_id'] as String?,
    );

Map<String, dynamic> _$RegisterVehicleRequestToJson(
        RegisterVehicleRequest instance) =>
    <String, dynamic>{
      'ca_vet': instance.caVet,
      'license_plate': instance.licensePlate,
      'user_id': instance.userId,
      'vehicle_id': instance.vehicleId,
    };
