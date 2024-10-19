// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_id_card_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyIdCardDataesponse _$VerifyIdCardDataesponseFromJson(
        Map<String, dynamic> json) =>
    VerifyIdCardDataesponse(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyIdCardDataesponseToJson(
        VerifyIdCardDataesponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'user': instance.user,
    };
