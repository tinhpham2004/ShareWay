// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_id_card_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyIdCardResponse _$VerifyIdCardResponseFromJson(
        Map<String, dynamic> json) =>
    VerifyIdCardResponse(
      data: json['data'] == null
          ? null
          : VerifyIdCardDataesponse.fromJson(
              json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
      messageEn: json['message_en'] as String?,
      messageVi: json['message_vi'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$VerifyIdCardResponseToJson(
        VerifyIdCardResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
      'message_en': instance.messageEn,
      'message_vi': instance.messageVi,
      'success': instance.success,
    };
