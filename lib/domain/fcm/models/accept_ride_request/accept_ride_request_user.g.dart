// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_ride_request_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptRideRequestUser _$AcceptRideRequestUserFromJson(
        Map<String, dynamic> json) =>
    AcceptRideRequestUser(
      id: json['user_id'] as String?,
      phoneNumber: json['phone_number'] as String?,
      fullName: json['full_name'] as String?,
    );

Map<String, dynamic> _$AcceptRideRequestUserToJson(
        AcceptRideRequestUser instance) =>
    <String, dynamic>{
      'user_id': instance.id,
      'phone_number': instance.phoneNumber,
      'full_name': instance.fullName,
    };
