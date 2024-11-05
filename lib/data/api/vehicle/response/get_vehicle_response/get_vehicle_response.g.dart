// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_vehicle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVehicleResponse _$GetVehicleResponseFromJson(Map<String, dynamic> json) =>
    GetVehicleResponse(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : GetVehicleDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      messageEn: json['message_en'] as String?,
      messageVi: json['message_vi'] as String?,
    );

Map<String, dynamic> _$GetVehicleResponseToJson(GetVehicleResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message_en': instance.messageEn,
      'message_vi': instance.messageVi,
    };
