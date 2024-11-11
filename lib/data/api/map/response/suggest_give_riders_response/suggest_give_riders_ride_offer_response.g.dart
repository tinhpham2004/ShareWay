// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_give_riders_ride_offer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestGiveRidersRideOfferResponse _$SuggestGiveRidersRideOfferResponseFromJson(
        Map<String, dynamic> json) =>
    SuggestGiveRidersRideOfferResponse(
      distance: (json['distance'] as num?)?.toDouble(),
      driverCurrentLatitude:
          (json['driver_current_latitude'] as num?)?.toDouble(),
      driverCurrentLongitude:
          (json['driver_current_longitude'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toInt(),
      encodedPolyline: json['encoded_polyline'] as String?,
      endAddress: json['end_address'] as String?,
      endLatitude: (json['end_latitude'] as num?)?.toDouble(),
      endLongitude: (json['end_longitude'] as num?)?.toDouble(),
      endTime: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
      fare: (json['fare'] as num?)?.toDouble(),
      rideOfferId: json['ride_offer_id'] as String?,
      startAddress: json['start_address'] as String?,
      startLatitude: (json['start_latitude'] as num?)?.toDouble(),
      startLongitude: (json['start_longitude'] as num?)?.toDouble(),
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      status: json['status'] as String?,
      user: json['user'] == null
          ? null
          : SuggestGiveRidersUserResponse.fromJson(
              json['user'] as Map<String, dynamic>),
      vehicle: json['vehicle'] == null
          ? null
          : SuggestGiveRidersVehicleResponse.fromJson(
              json['vehicle'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SuggestGiveRidersRideOfferResponseToJson(
        SuggestGiveRidersRideOfferResponse instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'driver_current_latitude': instance.driverCurrentLatitude,
      'driver_current_longitude': instance.driverCurrentLongitude,
      'duration': instance.duration,
      'encoded_polyline': instance.encodedPolyline,
      'end_address': instance.endAddress,
      'end_latitude': instance.endLatitude,
      'end_longitude': instance.endLongitude,
      'end_time': instance.endTime?.toIso8601String(),
      'fare': instance.fare,
      'ride_offer_id': instance.rideOfferId,
      'start_address': instance.startAddress,
      'start_latitude': instance.startLatitude,
      'start_longitude': instance.startLongitude,
      'start_time': instance.startTime?.toIso8601String(),
      'status': instance.status,
      'user': instance.user,
      'vehicle': instance.vehicle,
    };
