// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_ride_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelRideRequest _$CancelRideRequestFromJson(Map<String, dynamic> json) =>
    CancelRideRequest(
      receiverId: json['receiverID'] as String?,
      rideId: json['rideID'] as String?,
      vehicleId: json['vehicleID'] as String?,
    );

Map<String, dynamic> _$CancelRideRequestToJson(CancelRideRequest instance) =>
    <String, dynamic>{
      'receiverID': instance.receiverId,
      'rideID': instance.rideId,
      'vehicleID': instance.vehicleId,
    };
