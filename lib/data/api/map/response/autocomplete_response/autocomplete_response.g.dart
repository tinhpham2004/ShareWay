// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutocompleteResponse _$AutocompleteResponseFromJson(
        Map<String, dynamic> json) =>
    AutocompleteResponse(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : AutocompleteDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      messageEn: json['message_en'] as String?,
      messageVi: json['message_vi'] as String?,
    );

Map<String, dynamic> _$AutocompleteResponseToJson(
        AutocompleteResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message_en': instance.messageEn,
      'message_vi': instance.messageVi,
    };
