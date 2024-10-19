// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthDataCWProxy {
  AuthData phoneNumber(String phoneNumber);

  AuthData path(String path);

  AuthData email(String? email);

  AuthData name(String? name);

  AuthData userId(String? userId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthData(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthData call({
    String? phoneNumber,
    String? path,
    String? email,
    String? name,
    String? userId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthData.copyWith.fieldName(...)`
class _$AuthDataCWProxyImpl implements _$AuthDataCWProxy {
  const _$AuthDataCWProxyImpl(this._value);

  final AuthData _value;

  @override
  AuthData phoneNumber(String phoneNumber) => this(phoneNumber: phoneNumber);

  @override
  AuthData path(String path) => this(path: path);

  @override
  AuthData email(String? email) => this(email: email);

  @override
  AuthData name(String? name) => this(name: name);

  @override
  AuthData userId(String? userId) => this(userId: userId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthData(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthData call({
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? path = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
  }) {
    return AuthData(
      phoneNumber:
          phoneNumber == const $CopyWithPlaceholder() || phoneNumber == null
              ? _value.phoneNumber
              // ignore: cast_nullable_to_non_nullable
              : phoneNumber as String,
      path: path == const $CopyWithPlaceholder() || path == null
          ? _value.path
          // ignore: cast_nullable_to_non_nullable
          : path as String,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String?,
    );
  }
}

extension $AuthDataCopyWith on AuthData {
  /// Returns a callable class that can be used as follows: `instanceOfAuthData.copyWith(...)` or like so:`instanceOfAuthData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthDataCWProxy get copyWith => _$AuthDataCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthData _$AuthDataFromJson(Map<String, dynamic> json) => AuthData(
      phoneNumber: json['phoneNumber'] as String,
      path: json['path'] as String,
      email: json['email'] as String?,
      name: json['name'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$AuthDataToJson(AuthData instance) => <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'path': instance.path,
      'email': instance.email,
      'name': instance.name,
      'userId': instance.userId,
    };
