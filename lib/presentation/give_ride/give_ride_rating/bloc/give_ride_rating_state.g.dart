// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'give_ride_rating_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GiveRideRatingStateCWProxy {
  GiveRideRatingState isLoading(bool isLoading);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GiveRideRatingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GiveRideRatingState(...).copyWith(id: 12, name: "My name")
  /// ````
  GiveRideRatingState call({
    bool? isLoading,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGiveRideRatingState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGiveRideRatingState.copyWith.fieldName(...)`
class _$GiveRideRatingStateCWProxyImpl implements _$GiveRideRatingStateCWProxy {
  const _$GiveRideRatingStateCWProxyImpl(this._value);

  final GiveRideRatingState _value;

  @override
  GiveRideRatingState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GiveRideRatingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GiveRideRatingState(...).copyWith(id: 12, name: "My name")
  /// ````
  GiveRideRatingState call({
    Object? isLoading = const $CopyWithPlaceholder(),
  }) {
    return GiveRideRatingState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
    );
  }
}

extension $GiveRideRatingStateCopyWith on GiveRideRatingState {
  /// Returns a callable class that can be used as follows: `instanceOfGiveRideRatingState.copyWith(...)` or like so:`instanceOfGiveRideRatingState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GiveRideRatingStateCWProxy get copyWith =>
      _$GiveRideRatingStateCWProxyImpl(this);
}
