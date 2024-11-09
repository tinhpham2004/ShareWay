// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModelData _$ChatModelDataFromJson(Map<String, dynamic> json) =>
    ChatModelData(
      id: json['id'] as String?,
      name: json['name'] as String?,
      lastMessage: json['last_message'] as String?,
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      isOnline: json['is_online'] as bool?,
    );

Map<String, dynamic> _$ChatModelDataToJson(ChatModelData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'last_message': instance.lastMessage,
      'time': instance.time?.toIso8601String(),
      'is_online': instance.isOnline,
    };
