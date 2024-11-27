// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_hitch_riders_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestHitchRidersUserResponse _$SuggestHitchRidersUserResponseFromJson(
        Map<String, dynamic> json) =>
    SuggestHitchRidersUserResponse(
      fullName: json['full_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      userId: json['user_id'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$SuggestHitchRidersUserResponseToJson(
        SuggestHitchRidersUserResponse instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'phone_number': instance.phoneNumber,
      'user_id': instance.userId,
      'avatar_url': instance.avatarUrl,
      'gender': instance.gender,
    };
