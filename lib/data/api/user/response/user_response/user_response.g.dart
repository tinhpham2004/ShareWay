// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      email: json['email'] as String?,
      fullName: json['full_name'] as String?,
      id: json['id'] as String?,
      isActivated: json['is_activated'] as bool?,
      isVerified: json['is_verified'] as bool?,
      phoneNumber: json['phone_number'] as String?,
      role: json['role'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt?.toIso8601String(),
      'email': instance.email,
      'full_name': instance.fullName,
      'id': instance.id,
      'is_activated': instance.isActivated,
      'is_verified': instance.isVerified,
      'phone_number': instance.phoneNumber,
      'role': instance.role,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
