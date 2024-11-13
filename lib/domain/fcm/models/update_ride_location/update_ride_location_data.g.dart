// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_ride_location_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRideLocationData _$UpdateRideLocationDataFromJson(
        Map<String, dynamic> json) =>
    UpdateRideLocationData(
      rideId: json['ride_id'] as String?,
      rideOfferId: json['ride_offer_id'] as String?,
      rideRequestId: json['ride_request_id'] as String?,
      receiverId: json['receiver_id'] as String?,
      status: json['status'] as String?,
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      endTime: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
      startAddress: json['start_address'] as String?,
      endAddress: json['end_address'] as String?,
      fare: (json['fare'] as num?)?.toDouble(),
      encodedPolyline: json['encoded_polyline'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toInt(),
      transaction: json['transaction'] == null
          ? null
          : UpdateRideLocationTransaction.fromJson(
              json['transaction'] as Map<String, dynamic>),
      driverCurrentLatitude:
          (json['driver_current_latitude'] as num?)?.toDouble(),
      driverCurrentLongitude:
          (json['driver_current_longitude'] as num?)?.toDouble(),
      riderCurrentLatitude:
          (json['rider_current_latitude'] as num?)?.toDouble(),
      riderCurrentLongitude:
          (json['rider_current_longitude'] as num?)?.toDouble(),
      startLatitude: (json['start_latitude'] as num?)?.toDouble(),
      startLongitude: (json['start_longitude'] as num?)?.toDouble(),
      endLatitude: (json['end_latitude'] as num?)?.toDouble(),
      endLongitude: (json['end_longitude'] as num?)?.toDouble(),
      vehicle: json['vehicle'] == null
          ? null
          : UpdateRideLocationVehicle.fromJson(
              json['vehicle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateRideLocationDataToJson(
        UpdateRideLocationData instance) =>
    <String, dynamic>{
      'ride_id': instance.rideId,
      'ride_offer_id': instance.rideOfferId,
      'ride_request_id': instance.rideRequestId,
      'receiver_id': instance.receiverId,
      'status': instance.status,
      'start_time': instance.startTime?.toIso8601String(),
      'end_time': instance.endTime?.toIso8601String(),
      'start_address': instance.startAddress,
      'end_address': instance.endAddress,
      'fare': instance.fare,
      'encoded_polyline': instance.encodedPolyline,
      'distance': instance.distance,
      'duration': instance.duration,
      'transaction': instance.transaction,
      'driver_current_latitude': instance.driverCurrentLatitude,
      'driver_current_longitude': instance.driverCurrentLongitude,
      'rider_current_latitude': instance.riderCurrentLatitude,
      'rider_current_longitude': instance.riderCurrentLongitude,
      'start_latitude': instance.startLatitude,
      'start_longitude': instance.startLongitude,
      'end_latitude': instance.endLatitude,
      'end_longitude': instance.endLongitude,
      'vehicle': instance.vehicle,
    };
