// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_ride_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelRideRequest _$CancelRideRequestFromJson(Map<String, dynamic> json) =>
    CancelRideRequest(
      type: json['type'] as String?,
      data: json['data'] == null
          ? null
          : CancelRideRequestData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CancelRideRequestToJson(CancelRideRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
    };
