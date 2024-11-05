// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicles_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehiclesResponse _$VehiclesResponseFromJson(Map<String, dynamic> json) =>
    VehiclesResponse(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : VehicleDataResponse.fromJson(json['data'] as Map<String, dynamic>),
      messageEn: json['message_en'] as String?,
      messageVi: json['message_vi'] as String?,
    );

Map<String, dynamic> _$VehiclesResponseToJson(VehiclesResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message_en': instance.messageEn,
      'message_vi': instance.messageVi,
    };
