// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_ride_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingRideUserResponse _$PendingRideUserResponseFromJson(
        Map<String, dynamic> json) =>
    PendingRideUserResponse(
      userId: json['user_id'] as String?,
      phoneNumber: json['phone_number'] as String?,
      fullName: json['full_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      averageRating: (json['average_rating'] as num?)?.toDouble(),
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$PendingRideUserResponseToJson(
        PendingRideUserResponse instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'phone_number': instance.phoneNumber,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'average_rating': instance.averageRating,
      'gender': instance.gender,
    };
