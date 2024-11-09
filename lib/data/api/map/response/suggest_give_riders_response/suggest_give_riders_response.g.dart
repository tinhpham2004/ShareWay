// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_give_riders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestGiveRidersResponse _$SuggestGiveRidersResponseFromJson(
        Map<String, dynamic> json) =>
    SuggestGiveRidersResponse(
      data: json['data'] == null
          ? null
          : SuggestGiveRidersDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      error: json['error'] as String?,
      messageEn: json['message_en'] as String?,
      messageVi: json['message_vi'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$SuggestGiveRidersResponseToJson(
        SuggestGiveRidersResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
      'message_en': instance.messageEn,
      'message_vi': instance.messageVi,
      'success': instance.success,
    };
