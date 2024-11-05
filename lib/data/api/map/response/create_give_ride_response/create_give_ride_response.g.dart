// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_give_ride_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateGiveRideResponse _$CreateGiveRideResponseFromJson(
        Map<String, dynamic> json) =>
    CreateGiveRideResponse(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : CreateGiveRideDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      messageEn: json['message_en'] as String?,
      messageVi: json['message_vi'] as String?,
    );

Map<String, dynamic> _$CreateGiveRideResponseToJson(
        CreateGiveRideResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message_en': instance.messageEn,
      'message_vi': instance.messageVi,
    };
