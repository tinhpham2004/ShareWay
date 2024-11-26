// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_ride_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingRideDataResponse _$PendingRideDataResponseFromJson(
        Map<String, dynamic> json) =>
    PendingRideDataResponse(
      pendingRideRequest: (json['pending_ride_request'] as List<dynamic>?)
          ?.map((e) =>
              PendingRideRequestResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      pendingRideOffer: (json['pending_ride_offer'] as List<dynamic>?)
          ?.map((e) =>
              PendingRideOfferResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PendingRideDataResponseToJson(
        PendingRideDataResponse instance) =>
    <String, dynamic>{
      'pending_ride_request': instance.pendingRideRequest,
      'pending_ride_offer': instance.pendingRideOffer,
    };
