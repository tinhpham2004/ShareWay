// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_ride_offer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingRideOfferResponse _$PendingRideOfferResponseFromJson(
        Map<String, dynamic> json) =>
    PendingRideOfferResponse(
      rideOfferId: json['ride_offer_id'] as String?,
      user: json['user'] == null
          ? null
          : PendingRideUserResponse.fromJson(
              json['user'] as Map<String, dynamic>),
      vehicle: json['vehicle'] == null
          ? null
          : PendingRideVehicleResponse.fromJson(
              json['vehicle'] as Map<String, dynamic>),
      startLatitude: (json['start_latitude'] as num?)?.toDouble(),
      startLongitude: (json['start_longitude'] as num?)?.toDouble(),
      endLatitude: (json['end_latitude'] as num?)?.toDouble(),
      endLongitude: (json['end_longitude'] as num?)?.toDouble(),
      startAddress: json['start_address'] as String?,
      endAddress: json['end_address'] as String?,
      encodedPolyline: json['encoded_polyline'] as String?,
      distance: (json['distance'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      driverCurrentLatitude:
          (json['driver_current_latitude'] as num?)?.toDouble(),
      driverCurrentLongitude:
          (json['driver_current_longitude'] as num?)?.toDouble(),
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      endTime: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
      status: json['status'] as String?,
      fare: (json['fare'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PendingRideOfferResponseToJson(
        PendingRideOfferResponse instance) =>
    <String, dynamic>{
      'ride_offer_id': instance.rideOfferId,
      'user': instance.user,
      'vehicle': instance.vehicle,
      'start_latitude': instance.startLatitude,
      'start_longitude': instance.startLongitude,
      'end_latitude': instance.endLatitude,
      'end_longitude': instance.endLongitude,
      'start_address': instance.startAddress,
      'end_address': instance.endAddress,
      'encoded_polyline': instance.encodedPolyline,
      'distance': instance.distance,
      'duration': instance.duration,
      'driver_current_latitude': instance.driverCurrentLatitude,
      'driver_current_longitude': instance.driverCurrentLongitude,
      'start_time': instance.startTime?.toIso8601String(),
      'end_time': instance.endTime?.toIso8601String(),
      'status': instance.status,
      'fare': instance.fare,
    };
