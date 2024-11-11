// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_hitch_ride_request_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewHitchRideRequestData _$NewHitchRideRequestDataFromJson(
        Map<String, dynamic> json) =>
    NewHitchRideRequestData(
      rideOfferId: json['ride_offer_id'] as String?,
      rideRequestId: json['ride_request_id'] as String?,
      user: NewHitchRideRequestData._userFromJson(json['user'] as String?),
      startLatitude: NewHitchRideRequestData._doubleFromString(
          json['start_latitude'] as String?),
      startLongitude: NewHitchRideRequestData._doubleFromString(
          json['start_longitude'] as String?),
      endLatitude: NewHitchRideRequestData._doubleFromString(
          json['end_latitude'] as String?),
      endLongitude: NewHitchRideRequestData._doubleFromString(
          json['end_longitude'] as String?),
      riderCurrentLatitude: NewHitchRideRequestData._doubleFromString(
          json['rider_current_latitude'] as String?),
      riderCurrentLongitude: NewHitchRideRequestData._doubleFromString(
          json['rider_current_longitude'] as String?),
      startAddress: json['start_address'] as String?,
      endAddress: json['end_address'] as String?,
      status: json['status'] as String?,
      encodedPolyline: json['encoded_polyline'] as String?,
      distance: NewHitchRideRequestData._doubleFromString(
          json['distance'] as String?),
      duration:
          NewHitchRideRequestData._intFromString(json['duration'] as String?),
      startTime: NewHitchRideRequestData._dateTimeFromString(
          json['start_time'] as String?),
      endTime: NewHitchRideRequestData._dateTimeFromString(
          json['end_time'] as String?),
      vehicle:
          NewHitchRideRequestData._vehicleFromJson(json['vehicle'] as String?),
    );

Map<String, dynamic> _$NewHitchRideRequestDataToJson(
        NewHitchRideRequestData instance) =>
    <String, dynamic>{
      'ride_request_id': instance.rideRequestId,
      'ride_offer_id': instance.rideOfferId,
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
      'start_time': instance.startTime?.toIso8601String(),
      'end_time': instance.endTime?.toIso8601String(),
      'vehicle': instance.vehicle,
    };
