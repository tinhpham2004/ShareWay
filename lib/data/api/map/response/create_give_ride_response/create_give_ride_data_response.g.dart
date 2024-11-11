// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_give_ride_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGiveRideDataResponse _$CreateGiveRideDataResponseFromJson(
        Map<String, dynamic> json) =>
    CreateGiveRideDataResponse(
      route: json['route'] == null
          ? null
          : CreateGiveRideRouteResponse.fromJson(
              json['route'] as Map<String, dynamic>),
      rideOfferId: json['ride_offer_id'] as String?,
      distance: (json['distance'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      fare: (json['fare'] as num?)?.toDouble(),
      vehicle: json['vehicle'] == null
          ? null
          : CreateGiveRideVehicleResponse.fromJson(
              json['vehicle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateGiveRideDataResponseToJson(
        CreateGiveRideDataResponse instance) =>
    <String, dynamic>{
      'route': instance.route,
      'ride_offer_id': instance.rideOfferId,
      'distance': instance.distance,
      'duration': instance.duration,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'fare': instance.fare,
      'vehicle': instance.vehicle,
    };
