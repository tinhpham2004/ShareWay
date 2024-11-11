// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_ride_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchRideResponse _$MatchRideResponseFromJson(Map<String, dynamic> json) =>
    MatchRideResponse(
      data: json['data'] == null
          ? null
          : MatchRideDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
      messageEn: json['message_en'] as String?,
      messageVi: json['message_vi'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$MatchRideResponseToJson(MatchRideResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
      'message_en': instance.messageEn,
      'message_vi': instance.messageVi,
      'success': instance.success,
    };
