// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_ride_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptRideRequest _$AcceptRideRequestFromJson(Map<String, dynamic> json) =>
    AcceptRideRequest(
      type: json['type'] as String?,
      data: json['data'] == null
          ? null
          : AcceptRideRequestData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AcceptRideRequestToJson(AcceptRideRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
    };
