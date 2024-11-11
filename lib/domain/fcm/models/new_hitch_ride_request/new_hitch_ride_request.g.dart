// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_hitch_ride_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewHitchRideRequest _$NewHitchRideRequestFromJson(Map<String, dynamic> json) =>
    NewHitchRideRequest(
      type: json['type'] as String?,
      data: json['data'] == null
          ? null
          : NewHitchRideRequestData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewHitchRideRequestToJson(
        NewHitchRideRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
    };
