// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_ride_request_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelRideRequestData _$CancelRideRequestDataFromJson(
        Map<String, dynamic> json) =>
    CancelRideRequestData(
      rideOfferId: json['ride_offer_id'] as String?,
      rideRequestId: json['ride_request_id'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$CancelRideRequestDataToJson(
        CancelRideRequestData instance) =>
    <String, dynamic>{
      'ride_offer_id': instance.rideOfferId,
      'ride_request_id': instance.rideRequestId,
      'user_id': instance.userId,
    };
