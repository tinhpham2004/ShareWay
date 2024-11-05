// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_hitch_riders_ride_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestHitchRidersRideRequestResponse
    _$SuggestHitchRidersRideRequestResponseFromJson(
            Map<String, dynamic> json) =>
        SuggestHitchRidersRideRequestResponse(
          distance: (json['distance'] as num?)?.toDouble(),
          duration: (json['duration'] as num?)?.toInt(),
          encodedPolyline: json['encoded_polyline'] as String?,
          endAddress: json['end_address'] as String?,
          endLatitude: (json['end_latitude'] as num?)?.toDouble(),
          endLongitude: (json['end_longitude'] as num?)?.toDouble(),
          endTime: json['end_time'] == null
              ? null
              : DateTime.parse(json['end_time'] as String),
          rideRequestId: json['ride_request_id'] as String?,
          riderCurrentLatitude:
              (json['rider_current_latitude'] as num?)?.toDouble(),
          riderCurrentLongitude:
              (json['rider_current_longitude'] as num?)?.toDouble(),
          startAddress: json['start_address'] as String?,
          startLatitude: (json['start_latitude'] as num?)?.toDouble(),
          startLongitude: (json['start_longitude'] as num?)?.toDouble(),
          startTime: json['start_time'] == null
              ? null
              : DateTime.parse(json['start_time'] as String),
          status: json['status'] as String?,
          user: json['user'] == null
              ? null
              : SuggestHitchRidersUserResponse.fromJson(
                  json['user'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$SuggestHitchRidersRideRequestResponseToJson(
        SuggestHitchRidersRideRequestResponse instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'duration': instance.duration,
      'encoded_polyline': instance.encodedPolyline,
      'end_address': instance.endAddress,
      'end_latitude': instance.endLatitude,
      'end_longitude': instance.endLongitude,
      'end_time': instance.endTime?.toIso8601String(),
      'ride_request_id': instance.rideRequestId,
      'rider_current_latitude': instance.riderCurrentLatitude,
      'rider_current_longitude': instance.riderCurrentLongitude,
      'start_address': instance.startAddress,
      'start_latitude': instance.startLatitude,
      'start_longitude': instance.startLongitude,
      'start_time': instance.startTime?.toIso8601String(),
      'status': instance.status,
      'user': instance.user,
    };
