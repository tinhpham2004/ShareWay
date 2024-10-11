// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LoginStateCWProxy {
  LoginState phoneNumberController(
      TextEditingController? phoneNumberController);

  LoginState phoneNumber(String? phoneNumber);

  LoginState errorText(String? errorText);

  LoginState displayName(String? displayName);

  LoginState email(String? email);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginState call({
    TextEditingController? phoneNumberController,
    String? phoneNumber,
    String? errorText,
    String? displayName,
    String? email,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLoginState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLoginState.copyWith.fieldName(...)`
class _$LoginStateCWProxyImpl implements _$LoginStateCWProxy {
  const _$LoginStateCWProxyImpl(this._value);

  final LoginState _value;

  @override
  LoginState phoneNumberController(
          TextEditingController? phoneNumberController) =>
      this(phoneNumberController: phoneNumberController);

  @override
  LoginState phoneNumber(String? phoneNumber) => this(phoneNumber: phoneNumber);

  @override
  LoginState errorText(String? errorText) => this(errorText: errorText);

  @override
  LoginState displayName(String? displayName) => this(displayName: displayName);

  @override
  LoginState email(String? email) => this(email: email);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LoginState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LoginState(...).copyWith(id: 12, name: "My name")
  /// ````
  LoginState call({
    Object? phoneNumberController = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? errorText = const $CopyWithPlaceholder(),
    Object? displayName = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
  }) {
    return LoginState(
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
    );
  }
}

extension $LoginStateCopyWith on LoginState {
  /// Returns a callable class that can be used as follows: `instanceOfLoginState.copyWith(...)` or like so:`instanceOfLoginState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LoginStateCWProxy get copyWith => _$LoginStateCWProxyImpl(this);
}
