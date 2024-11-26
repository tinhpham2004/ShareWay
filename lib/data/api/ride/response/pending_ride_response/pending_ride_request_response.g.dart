// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_ride_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingRideRequestResponse _$PendingRideRequestResponseFromJson(
        Map<String, dynamic> json) =>
    PendingRideRequestResponse(
      rideRequestId: json['ride_request_id'] as String?,
      user: json['user'] == null
          ? null
          : PendingRideUserResponse.fromJson(
              json['user'] as Map<String, dynamic>),
      startLatitude: (json['start_latitude'] as num?)?.toDouble(),
      startLongitude: (json['start_longitude'] as num?)?.toDouble(),
      endLatitude: (json['end_latitude'] as num?)?.toDouble(),
      endLongitude: (json['end_longitude'] as num?)?.toDouble(),
      riderCurrentLatitude:
          (json['rider_current_latitude'] as num?)?.toDouble(),
      riderCurrentLongitude:
          (json['rider_current_longitude'] as num?)?.toDouble(),
      startAddress: json['start_address'] as String?,
      endAddress: json['end_address'] as String?,
      status: json['status'] as String?,
      encodedPolyline: json['encoded_polyline'] as String?,
      distance: (json['distance'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
    );

Map<String, dynamic> _$PendingRideRequestResponseToJson(
        PendingRideRequestResponse instance) =>
    <String, dynamic>{
      'ride_request_id': instance.rideRequestId,
      'user': instance.user,
      'start_latitude': instance.startLatitude,
      'start_longitude': instance.startLongitude,
      'end_latitude': instance.endLatitude,
      'end_longitude': instance.endLongitude,
      'rider_current_latitude': instance.riderCurrentLatitude,
      'rider_current_longitude': instance.riderCurrentLongitude,
      'start_address': instance.startAddress,
      'end_address': instance.endAddress,
      'status': instance.status,
      'encoded_polyline': instance.encodedPolyline,
      'distance': instance.distance,
      'duration': instance.duration,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };
