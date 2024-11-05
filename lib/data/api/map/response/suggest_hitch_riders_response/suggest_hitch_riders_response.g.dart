// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_hitch_riders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestHitchRidersResponse _$SuggestHitchRidersResponseFromJson(
        Map<String, dynamic> json) =>
    SuggestHitchRidersResponse(
      data: json['data'] == null
          ? null
          : SuggestHitchRidersDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
      messageEn: json['message_en'] as String?,
      messageVi: json['message_vi'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$SuggestHitchRidersResponseToJson(
        SuggestHitchRidersResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
      'message_en': instance.messageEn,
      'message_vi': instance.messageVi,
      'success': instance.success,
    };
