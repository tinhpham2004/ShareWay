// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_ride_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryRideResponse _$HistoryRideResponseFromJson(Map<String, dynamic> json) =>
    HistoryRideResponse(
      data: json['data'] == null
          ? null
          : HistoryRideDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
      messageEn: json['message_en'] as String?,
      messageVi: json['message_vi'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$HistoryRideResponseToJson(
        HistoryRideResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
      'message_en': instance.messageEn,
      'message_vi': instance.messageVi,
      'success': instance.success,
    };
