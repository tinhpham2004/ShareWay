// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hitch_ride_complete_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HitchRideCompleteStateCWProxy {
  HitchRideCompleteState isLoading(bool isLoading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HitchRideCompleteState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HitchRideCompleteState(...).copyWith(id: 12, name: "My name")
  /// ````
  HitchRideCompleteState call({
    bool? isLoading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHitchRideCompleteState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHitchRideCompleteState.copyWith.fieldName(...)`
class _$HitchRideCompleteStateCWProxyImpl
    implements _$HitchRideCompleteStateCWProxy {
  const _$HitchRideCompleteStateCWProxyImpl(this._value);

  final HitchRideCompleteState _value;

  @override
  HitchRideCompleteState isLoading(bool isLoading) =>
      this(isLoading: isLoading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HitchRideCompleteState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HitchRideCompleteState(...).copyWith(id: 12, name: "My name")
  /// ````
  HitchRideCompleteState call({
    Object? isLoading = const $CopyWithPlaceholder(),
  }) {
    return HitchRideCompleteState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
    );
  }
}

extension $HitchRideCompleteStateCopyWith on HitchRideCompleteState {
  /// Returns a callable class that can be used as follows: `instanceOfHitchRideCompleteState.copyWith(...)` or like so:`instanceOfHitchRideCompleteState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HitchRideCompleteStateCWProxy get copyWith =>
      _$HitchRideCompleteStateCWProxyImpl(this);
}
