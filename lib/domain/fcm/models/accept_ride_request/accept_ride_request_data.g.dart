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
      user: AcceptRideRequestData._userFromJson(json['user']),
      status: json['status'] as String?,
      startTime: AcceptRideRequestData._dateTimeFromString(
          json['start_time'] as String?),
      endTime: AcceptRideRequestData._dateTimeFromString(
          json['end_time'] as String?),
      startAddress: json['start_address'] as String?,
      endAddress: json['end_address'] as String?,
      fare: AcceptRideRequestData._doubleFromString(json['fare']),
      encodedPolyline: json['encoded_polyline'] as String?,
      distance: AcceptRideRequestData._doubleFromString(json['distance']),
      duration: AcceptRideRequestData._intFromString(json['duration']),
      transaction:
          AcceptRideRequestData._transactionFromJson(json['transaction']),
      startLatitude:
          AcceptRideRequestData._doubleFromString(json['start_latitude']),
      startLongitude:
          AcceptRideRequestData._doubleFromString(json['start_longitude']),
      endLatitude:
          AcceptRideRequestData._doubleFromString(json['end_latitude']),
      endLongitude:
          AcceptRideRequestData._doubleFromString(json['end_longitude']),
      vehicle: AcceptRideRequestData._vehicleFromJson(json['vehicle']),
    )
      ..driverLatitude =
          AcceptRideRequestData._doubleFromString(json['driver_latitude'])
      ..driverLongitude =
          AcceptRideRequestData._doubleFromString(json['driver_longitude'])
      ..riderLatitude =
          AcceptRideRequestData._doubleFromString(json['rider_latitude'])
      ..riderLongitude =
          AcceptRideRequestData._doubleFromString(json['rider_longitude']);

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
