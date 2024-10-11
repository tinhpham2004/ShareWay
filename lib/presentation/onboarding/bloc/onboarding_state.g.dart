// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OnboardingStateCWProxy {
  OnboardingState isLoading(bool isLoading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OnboardingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OnboardingState(...).copyWith(id: 12, name: "My name")
  /// ````
  OnboardingState call({
    bool? isLoading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOnboardingState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOnboardingState.copyWith.fieldName(...)`
class _$OnboardingStateCWProxyImpl implements _$OnboardingStateCWProxy {
  const _$OnboardingStateCWProxyImpl(this._value);

  final OnboardingState _value;

  @override
  OnboardingState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OnboardingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OnboardingState(...).copyWith(id: 12, name: "My name")
  /// ````
  OnboardingState call({
    Object? isLoading = const $CopyWithPlaceholder(),
  }) {
    return OnboardingState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
    );
  }
}

extension $OnboardingStateCopyWith on OnboardingState {
  /// Returns a callable class that can be used as follows: `instanceOfOnboardingState.copyWith(...)` or like so:`instanceOfOnboardingState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OnboardingStateCWProxy get copyWith => _$OnboardingStateCWProxyImpl(this);
}
