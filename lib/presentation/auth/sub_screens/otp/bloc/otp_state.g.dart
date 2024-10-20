// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OtpStateCWProxy {
  OtpState isLoading(bool isLoading);

  OtpState remainingTime(int remainingTime);

  OtpState authData(AuthData? authData);

  OtpState otpCode(List<int>? otpCode);

  OtpState errorText(String? errorText);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OtpState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OtpState(...).copyWith(id: 12, name: "My name")
  /// ````
  OtpState call({
    bool? isLoading,
    int? remainingTime,
    AuthData? authData,
    List<int>? otpCode,
    String? errorText,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOtpState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOtpState.copyWith.fieldName(...)`
class _$OtpStateCWProxyImpl implements _$OtpStateCWProxy {
  const _$OtpStateCWProxyImpl(this._value);

  final OtpState _value;

  @override
  OtpState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  OtpState remainingTime(int remainingTime) =>
      this(remainingTime: remainingTime);

  @override
  OtpState authData(AuthData? authData) => this(authData: authData);

  @override
  OtpState otpCode(List<int>? otpCode) => this(otpCode: otpCode);

  @override
  OtpState errorText(String? errorText) => this(errorText: errorText);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OtpState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OtpState(...).copyWith(id: 12, name: "My name")
  /// ````
  OtpState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? remainingTime = const $CopyWithPlaceholder(),
    Object? authData = const $CopyWithPlaceholder(),
    Object? otpCode = const $CopyWithPlaceholder(),
    Object? errorText = const $CopyWithPlaceholder(),
  }) {
    return OtpState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      remainingTime:
          remainingTime == const $CopyWithPlaceholder() || remainingTime == null
              ? _value.remainingTime
              // ignore: cast_nullable_to_non_nullable
              : remainingTime as int,
      authData: authData == const $CopyWithPlaceholder()
          ? _value.authData
          // ignore: cast_nullable_to_non_nullable
          : authData as AuthData?,
      otpCode: otpCode == const $CopyWithPlaceholder()
          ? _value.otpCode
          // ignore: cast_nullable_to_non_nullable
          : otpCode as List<int>?,
      errorText: errorText == const $CopyWithPlaceholder()
          ? _value.errorText
          // ignore: cast_nullable_to_non_nullable
          : errorText as String?,
    );
  }
}

extension $OtpStateCopyWith on OtpState {
  /// Returns a callable class that can be used as follows: `instanceOfOtpState.copyWith(...)` or like so:`instanceOfOtpState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OtpStateCWProxy get copyWith => _$OtpStateCWProxyImpl(this);
}
