// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_give_ride_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewGiveRideRequest _$NewGiveRideRequestFromJson(Map<String, dynamic> json) =>
    NewGiveRideRequest(
      type: json['type'] as String?,
      data: json['data'] == null
          ? null
          : NewGiveRideRequestData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewGiveRideRequestToJson(NewGiveRideRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
    };
