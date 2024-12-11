// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RideHistoryResponse _$RideHistoryResponseFromJson(Map<String, dynamic> json) =>
    RideHistoryResponse(
      distance: (json['distance'] as num?)?.toDouble(),
      driver: json['driver'] == null
          ? null
          : HistoryRideDriverResponse.fromJson(
              json['driver'] as Map<String, dynamic>),
      driverCurrentLatitude:
          (json['driver_current_latitude'] as num?)?.toDouble(),
      driverCurrentLongitude:
          (json['driver_current_longitude'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toInt(),
      encodedPolyline: json['encoded_polyline'] as String?,
      endAddress: json['end_address'] as String?,
      endLatitude: (json['end_latitude'] as num?)?.toDouble(),
      endLongitude: (json['end_longitude'] as num?)?.toDouble(),
      endTime: json['end_time'] as String?,
      fare: (json['fare'] as num?)?.toInt(),
      hitcher: json['hitcher'] == null
          ? null
          : HistoryRideHitcherResponse.fromJson(
              json['hitcher'] as Map<String, dynamic>),
      rideId: json['ride_id'] as String?,
      rideOfferId: json['ride_offer_id'] as String?,
      rideRequestId: json['ride_request_id'] as String?,
      riderCurrentLatitude:
          (json['rider_current_latitude'] as num?)?.toDouble(),
      riderCurrentLongitude:
          (json['rider_current_longitude'] as num?)?.toDouble(),
      startAddress: json['start_address'] as String?,
      startLatitude: (json['start_latitude'] as num?)?.toDouble(),
      startLongitude: (json['start_longitude'] as num?)?.toDouble(),
      startTime: json['start_time'] as String?,
      status: json['status'] as String?,
      transaction: json['transaction'] == null
          ? null
          : HistoryRideTransactionResponse.fromJson(
              json['transaction'] as Map<String, dynamic>),
      vehicle: json['vehicle'] == null
          ? null
          : HistoryRideVehicleResponse.fromJson(
              json['vehicle'] as Map<String, dynamic>),
      waypoints: (json['waypoints'] as List<dynamic>?)
          ?.map((e) =>
              HistoryRideWaypointResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RideHistoryResponseToJson(
        RideHistoryResponse instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'driver': instance.driver,
      'driver_current_latitude': instance.driverCurrentLatitude,
      'driver_current_longitude': instance.driverCurrentLongitude,
      'duration': instance.duration,
      'encoded_polyline': instance.encodedPolyline,
      'end_address': instance.endAddress,
      'end_latitude': instance.endLatitude,
      'end_longitude': instance.endLongitude,
      'end_time': instance.endTime,
      'fare': instance.fare,
      'hitcher': instance.hitcher,
      'ride_id': instance.rideId,
      'ride_offer_id': instance.rideOfferId,
      'ride_request_id': instance.rideRequestId,
      'rider_current_latitude': instance.riderCurrentLatitude,
      'rider_current_longitude': instance.riderCurrentLongitude,
      'start_address': instance.startAddress,
      'start_latitude': instance.startLatitude,
      'start_longitude': instance.startLongitude,
      'start_time': instance.startTime,
      'status': instance.status,
      'transaction': instance.transaction,
      'vehicle': instance.vehicle,
      'waypoints': instance.waypoints,
    };
