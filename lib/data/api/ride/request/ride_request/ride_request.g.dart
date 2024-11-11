// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RideRequest _$RideRequestFromJson(Map<String, dynamic> json) => RideRequest(
      receiverId: json['receiverID'] as String?,
      rideOfferId: json['rideOfferID'] as String?,
      rideRequestId: json['rideRequestID'] as String?,
      vehicleId: json['vehicleID'] as String?,
    );

Map<String, dynamic> _$RideRequestToJson(RideRequest instance) =>
    <String, dynamic>{
      'receiverID': instance.receiverId,
      'rideOfferID': instance.rideOfferId,
      'rideRequestID': instance.rideRequestId,
      'vehicleID': instance.vehicleId,
    };
