// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AppUserCWProxy {
  AppUser createdAt(DateTime? createdAt);

  AppUser email(String? email);

  AppUser fullName(String? fullName);

  AppUser id(String? id);

  AppUser isActivated(bool? isActivated);

  AppUser isVerified(bool? isVerified);

  AppUser phoneNumber(String? phoneNumber);

  AppUser role(String? role);

  AppUser updatedAt(DateTime? updatedAt);

  AppUser avatarUrl(String? avatarUrl);

  AppUser averageRating(double? averageRating);

  AppUser gender(GenderEnum gender);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppUser(...).copyWith(id: 12, name: "My name")
  /// ````
  AppUser call({
    DateTime? createdAt,
    String? email,
    String? fullName,
    String? id,
    bool? isActivated,
    bool? isVerified,
    String? phoneNumber,
    String? role,
    DateTime? updatedAt,
    String? avatarUrl,
    double? averageRating,
    GenderEnum? gender,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAppUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAppUser.copyWith.fieldName(...)`
class _$AppUserCWProxyImpl implements _$AppUserCWProxy {
  const _$AppUserCWProxyImpl(this._value);

  final AppUser _value;

  @override
  AppUser createdAt(DateTime? createdAt) => this(createdAt: createdAt);

  @override
  AppUser email(String? email) => this(email: email);

  @override
  AppUser fullName(String? fullName) => this(fullName: fullName);

  @override
  AppUser id(String? id) => this(id: id);

  @override
  AppUser isActivated(bool? isActivated) => this(isActivated: isActivated);

  @override
  AppUser isVerified(bool? isVerified) => this(isVerified: isVerified);

  @override
  AppUser phoneNumber(String? phoneNumber) => this(phoneNumber: phoneNumber);

  @override
  AppUser role(String? role) => this(role: role);

  @override
  AppUser updatedAt(DateTime? updatedAt) => this(updatedAt: updatedAt);

  @override
  AppUser avatarUrl(String? avatarUrl) => this(avatarUrl: avatarUrl);

  @override
  AppUser averageRating(double? averageRating) =>
      this(averageRating: averageRating);

  @override
  AppUser gender(GenderEnum gender) => this(gender: gender);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AppUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AppUser(...).copyWith(id: 12, name: "My name")
  /// ````
  AppUser call({
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? fullName = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? isActivated = const $CopyWithPlaceholder(),
    Object? isVerified = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? avatarUrl = const $CopyWithPlaceholder(),
    Object? averageRating = const $CopyWithPlaceholder(),
    Object? gender = const $CopyWithPlaceholder(),
  }) {
    return AppUser(
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      fullName: fullName == const $CopyWithPlaceholder()
          ? _value.fullName
          // ignore: cast_nullable_to_non_nullable
          : fullName as String?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      isActivated: isActivated == const $CopyWithPlaceholder()
          ? _value.isActivated
          // ignore: cast_nullable_to_non_nullable
          : isActivated as bool?,
      isVerified: isVerified == const $CopyWithPlaceholder()
          ? _value.isVerified
          // ignore: cast_nullable_to_non_nullable
          : isVerified as bool?,
      phoneNumber: phoneNumber == const $CopyWithPlaceholder()
          ? _value.phoneNumber
          // ignore: cast_nullable_to_non_nullable
          : phoneNumber as String?,
      role: role == const $CopyWithPlaceholder()
          ? _value.role
          // ignore: cast_nullable_to_non_nullable
          : role as String?,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime?,
      avatarUrl: avatarUrl == const $CopyWithPlaceholder()
          ? _value.avatarUrl
          // ignore: cast_nullable_to_non_nullable
          : avatarUrl as String?,
      averageRating: averageRating == const $CopyWithPlaceholder()
          ? _value.averageRating
          // ignore: cast_nullable_to_non_nullable
          : averageRating as double?,
      gender: gender == const $CopyWithPlaceholder() || gender == null
          ? _value.gender
          // ignore: cast_nullable_to_non_nullable
          : gender as GenderEnum,
    );
  }
}

extension $AppUserCopyWith on AppUser {
  /// Returns a callable class that can be used as follows: `instanceOfAppUser.copyWith(...)` or like so:`instanceOfAppUser.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AppUserCWProxy get copyWith => _$AppUserCWProxyImpl(this);
}
