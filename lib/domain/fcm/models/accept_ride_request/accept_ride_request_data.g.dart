// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_ride_request_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptRideRequestData _$AcceptRideRequestDataFromJson(
        Map<String, dynamic> json) =>
    AcceptRideRequestData(
      rideId: json['ride_id'] as String?,
      rideOfferId: json['ride_offer_id'] as String?,
      rideRequestId: json['ride_request_id'] as String?,
      user: AcceptRideRequestData._userFromJson(json['user'] as String?),
      status: json['status'] as String?,
      startTime: AcceptRideRequestData._dateTimeFromString(
          json['start_time'] as String?),
      endTime: AcceptRideRequestData._dateTimeFromString(
          json['end_time'] as String?),
      startAddress: json['start_address'] as String?,
      endAddress: json['end_address'] as String?,
      fare: AcceptRideRequestData._doubleFromString(json['fare'] as String?),
      encodedPolyline: json['encoded_polyline'] as String?,
      distance:
          AcceptRideRequestData._doubleFromString(json['distance'] as String?),
      duration:
          AcceptRideRequestData._intFromString(json['duration'] as String?),
      transaction: AcceptRideRequestData._transactionFromJson(
          json['transaction'] as String?),
      startLatitude: AcceptRideRequestData._doubleFromString(
          json['start_latitude'] as String?),
      startLongitude: AcceptRideRequestData._doubleFromString(
          json['start_longitude'] as String?),
      endLatitude: AcceptRideRequestData._doubleFromString(
          json['end_latitude'] as String?),
      endLongitude: AcceptRideRequestData._doubleFromString(
          json['end_longitude'] as String?),
      vehicle:
          AcceptRideRequestData._vehicleFromJson(json['vehicle'] as String?),
    )
      ..driverLatitude = AcceptRideRequestData._doubleFromString(
          json['driver_latitude'] as String?)
      ..driverLongitude = AcceptRideRequestData._doubleFromString(
          json['driver_longitude'] as String?)
      ..riderLatitude = AcceptRideRequestData._doubleFromString(
          json['rider_latitude'] as String?)
      ..riderLongitude = AcceptRideRequestData._doubleFromString(
          json['rider_longitude'] as String?);

Map<String, dynamic> _$AcceptRideRequestDataToJson(
        AcceptRideRequestData instance) =>
    <String, dynamic>{
      'ride_id': instance.rideId,
      'ride_offer_id': instance.rideOfferId,
      'ride_request_id': instance.rideRequestId,
      'user': instance.user,
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
      'start_latitude': instance.startLatitude,
      'start_longitude': instance.startLongitude,
      'end_latitude': instance.endLatitude,
      'end_longitude': instance.endLongitude,
      'driver_latitude': instance.driverLatitude,
      'driver_longitude': instance.driverLongitude,
      'rider_latitude': instance.riderLatitude,
      'rider_longitude': instance.riderLongitude,
      'vehicle': instance.vehicle,
    };
