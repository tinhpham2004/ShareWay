// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_hitch_ride_request_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewHitchRideRequestUser _$NewHitchRideRequestUserFromJson(
        Map<String, dynamic> json) =>
    NewHitchRideRequestUser(
      id: json['user_id'] as String?,
      phoneNumber: json['phone_number'] as String?,
      fullName: json['full_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$NewHitchRideRequestUserToJson(
        NewHitchRideRequestUser instance) =>
    <String, dynamic>{
      'user_id': instance.id,
      'phone_number': instance.phoneNumber,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'gender': instance.gender,
    };
