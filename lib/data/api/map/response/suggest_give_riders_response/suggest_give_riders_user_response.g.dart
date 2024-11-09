// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_give_riders_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestGiveRidersUserResponse _$SuggestGiveRidersUserResponseFromJson(
        Map<String, dynamic> json) =>
    SuggestGiveRidersUserResponse(
      fullName: json['full_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$SuggestGiveRidersUserResponseToJson(
        SuggestGiveRidersUserResponse instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'phone_number': instance.phoneNumber,
      'user_id': instance.userId,
    };
