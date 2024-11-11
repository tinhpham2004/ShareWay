// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_give_ride_request_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewGiveRideRequestData _$NewGiveRideRequestDataFromJson(
        Map<String, dynamic> json) =>
    NewGiveRideRequestData(
      rideOfferId: json['ride_offer_id'] as String?,
      rideRequestId: json['ride_request_id'] as String?,
      receiverId: json['receiver_id'] as String?,
      user: NewGiveRideRequestData._userFromJson(json['user'] as String?),
      vehicle:
          NewGiveRideRequestData._vehicleFromJson(json['vehicle'] as String?),
      startLatitude: NewGiveRideRequestData._doubleFromString(
          json['start_latitude'] as String?),
      startLongitude: NewGiveRideRequestData._doubleFromString(
          json['start_longitude'] as String?),
      endLatitude: NewGiveRideRequestData._doubleFromString(
          json['end_latitude'] as String?),
      endLongitude: NewGiveRideRequestData._doubleFromString(
          json['end_longitude'] as String?),
      startAddress: json['start_address'] as String?,
      endAddress: json['end_address'] as String?,
      encodedPolyline: json['encoded_polyline'] as String?,
      distance:
          NewGiveRideRequestData._doubleFromString(json['distance'] as String?),
      duration:
          NewGiveRideRequestData._intFromString(json['duration'] as String?),
      driverCurrentLatitude: NewGiveRideRequestData._doubleFromString(
          json['driver_current_latitude'] as String?),
      driverCurrentLongitude: NewGiveRideRequestData._doubleFromString(
          json['driver_current_longitude'] as String?),
      startTime: NewGiveRideRequestData._dateTimeFromString(
          json['start_time'] as String?),
      endTime: NewGiveRideRequestData._dateTimeFromString(
          json['end_time'] as String?),
      status: json['status'] as String?,
      fare: NewGiveRideRequestData._doubleFromString(json['fare'] as String?),
    );

Map<String, dynamic> _$NewGiveRideRequestDataToJson(
        NewGiveRideRequestData instance) =>
    <String, dynamic>{
      'ride_offer_id': instance.rideOfferId,
      'ride_request_id': instance.rideRequestId,
      'receiver_id': instance.receiverId,
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
