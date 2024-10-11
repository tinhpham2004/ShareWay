// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OtpStateCWProxy {
  OtpState remainingTime(int remainingTime);

  OtpState phoneNumber(String? phoneNumber);

  OtpState otpCode(List<int>? otpCode);

  OtpState errorText(String? errorText);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OtpState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OtpState(...).copyWith(id: 12, name: "My name")
  /// ````
  OtpState call({
    int? remainingTime,
    String? phoneNumber,
    List<int>? otpCode,
    String? errorText,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOtpState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOtpState.copyWith.fieldName(...)`
class _$OtpStateCWProxyImpl implements _$OtpStateCWProxy {
  const _$OtpStateCWProxyImpl(this._value);

  final OtpState _value;

  @override
  OtpState remainingTime(int remainingTime) =>
      this(remainingTime: remainingTime);

  @override
  OtpState phoneNumber(String? phoneNumber) => this(phoneNumber: phoneNumber);

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
    Object? remainingTime = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? otpCode = const $CopyWithPlaceholder(),
    Object? errorText = const $CopyWithPlaceholder(),
  }) {
    return OtpState(
      remainingTime:
          remainingTime == const $CopyWithPlaceholder() || remainingTime == null
              ? _value.remainingTime
              // ignore: cast_nullable_to_non_nullable
              : remainingTime as int,
      phoneNumber: phoneNumber == const $CopyWithPlaceholder()
          ? _value.phoneNumber
          // ignore: cast_nullable_to_non_nullable
          : phoneNumber as String?,
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
