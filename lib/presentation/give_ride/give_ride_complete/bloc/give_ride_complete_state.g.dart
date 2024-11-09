// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'give_ride_complete_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GiveRideCompleteStateCWProxy {
  GiveRideCompleteState isLoading(bool isLoading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GiveRideCompleteState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GiveRideCompleteState(...).copyWith(id: 12, name: "My name")
  /// ````
  GiveRideCompleteState call({
    bool? isLoading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGiveRideCompleteState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGiveRideCompleteState.copyWith.fieldName(...)`
class _$GiveRideCompleteStateCWProxyImpl
    implements _$GiveRideCompleteStateCWProxy {
  const _$GiveRideCompleteStateCWProxyImpl(this._value);

  final GiveRideCompleteState _value;

  @override
  GiveRideCompleteState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GiveRideCompleteState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GiveRideCompleteState(...).copyWith(id: 12, name: "My name")
  /// ````
  GiveRideCompleteState call({
    Object? isLoading = const $CopyWithPlaceholder(),
  }) {
    return GiveRideCompleteState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
    );
  }
}

extension $GiveRideCompleteStateCopyWith on GiveRideCompleteState {
  /// Returns a callable class that can be used as follows: `instanceOfGiveRideCompleteState.copyWith(...)` or like so:`instanceOfGiveRideCompleteState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GiveRideCompleteStateCWProxy get copyWith =>
      _$GiveRideCompleteStateCWProxyImpl(this);
}
