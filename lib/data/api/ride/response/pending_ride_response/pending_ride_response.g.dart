// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_ride_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingRideResponse _$PendingRideResponseFromJson(Map<String, dynamic> json) =>
    PendingRideResponse(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : PendingRideDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      messageEn: json['message_en'] as String?,
      messageVi: json['message_vi'] as String?,
    );

Map<String, dynamic> _$PendingRideResponseToJson(
        PendingRideResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message_en': instance.messageEn,
      'message_vi': instance.messageVi,
    };
