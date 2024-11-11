// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matched_ride_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchedRideRequest _$MatchedRideRequestFromJson(Map<String, dynamic> json) =>
    MatchedRideRequest(
      currentLocation: json['currentLocation'] == null
          ? null
          : MatchedRideCurrentLocationRequest.fromJson(
              json['currentLocation'] as Map<String, dynamic>),
      rideId: json['rideID'] as String?,
    );

Map<String, dynamic> _$MatchedRideRequestToJson(MatchedRideRequest instance) =>
    <String, dynamic>{
      'currentLocation': instance.currentLocation,
      'rideID': instance.rideId,
    };
