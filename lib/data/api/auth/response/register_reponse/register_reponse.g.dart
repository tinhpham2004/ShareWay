// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterReponse _$RegisterReponseFromJson(Map<String, dynamic> json) =>
    RegisterReponse(
      data: json['data'] == null
          ? null
          : RegisterDataResponse.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
      messageEn: json['message_en'] as String?,
      messageVi: json['message_vi'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$RegisterReponseToJson(RegisterReponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
      'message_en': instance.messageEn,
      'message_vi': instance.messageVi,
      'success': instance.success,
    };
