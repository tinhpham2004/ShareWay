// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthStateCWProxy {
  AuthState phoneNumberController(TextEditingController? phoneNumberController);

  AuthState phoneNumber(String? phoneNumber);

  AuthState errorText(String? errorText);

  AuthState displayName(String? displayName);

  AuthState email(String? email);

  AuthState path(String? path);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthState(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthState call({
    TextEditingController? phoneNumberController,
    String? phoneNumber,
    String? errorText,
    String? displayName,
    String? email,
    String? path,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthState.copyWith.fieldName(...)`
class _$AuthStateCWProxyImpl implements _$AuthStateCWProxy {
  const _$AuthStateCWProxyImpl(this._value);

  final AuthState _value;

  @override
  AuthState phoneNumberController(
          TextEditingController? phoneNumberController) =>
      this(phoneNumberController: phoneNumberController);

  @override
  AuthState phoneNumber(String? phoneNumber) => this(phoneNumber: phoneNumber);

  @override
  AuthState errorText(String? errorText) => this(errorText: errorText);

  @override
  AuthState displayName(String? displayName) => this(displayName: displayName);

  @override
  AuthState email(String? email) => this(email: email);

  @override
  AuthState path(String? path) => this(path: path);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthState(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthState call({
    Object? phoneNumberController = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? errorText = const $CopyWithPlaceholder(),
    Object? displayName = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? path = const $CopyWithPlaceholder(),
  }) {
    return AuthState(
      phoneNumberController:
          phoneNumberController == const $CopyWithPlaceholder()
              ? _value.phoneNumberController
              // ignore: cast_nullable_to_non_nullable
              : phoneNumberController as TextEditingController?,
      phoneNumber: phoneNumber == const $CopyWithPlaceholder()
          ? _value.phoneNumber
          // ignore: cast_nullable_to_non_nullable
          : phoneNumber as String?,
      errorText: errorText == const $CopyWithPlaceholder()
          ? _value.errorText
          // ignore: cast_nullable_to_non_nullable
          : errorText as String?,
      displayName: displayName == const $CopyWithPlaceholder()
          ? _value.displayName
          // ignore: cast_nullable_to_non_nullable
          : displayName as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      path: path == const $CopyWithPlaceholder()
          ? _value.path
          // ignore: cast_nullable_to_non_nullable
          : path as String?,
    );
  }
}

extension $AuthStateCopyWith on AuthState {
  /// Returns a callable class that can be used as follows: `instanceOfAuthState.copyWith(...)` or like so:`instanceOfAuthState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthStateCWProxy get copyWith => _$AuthStateCWProxyImpl(this);
}
