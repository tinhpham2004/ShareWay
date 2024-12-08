// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hitch_ride_rating_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HitchRideRatingStateCWProxy {
  HitchRideRatingState isLoading(bool isLoading);

  HitchRideRatingState star(int? star);

  HitchRideRatingState feedback(String? feedback);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HitchRideRatingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HitchRideRatingState(...).copyWith(id: 12, name: "My name")
  /// ````
  HitchRideRatingState call({
    bool? isLoading,
    int? star,
    String? feedback,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHitchRideRatingState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHitchRideRatingState.copyWith.fieldName(...)`
class _$HitchRideRatingStateCWProxyImpl
    implements _$HitchRideRatingStateCWProxy {
  const _$HitchRideRatingStateCWProxyImpl(this._value);

  final HitchRideRatingState _value;

  @override
  HitchRideRatingState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  HitchRideRatingState star(int? star) => this(star: star);

  @override
  HitchRideRatingState feedback(String? feedback) => this(feedback: feedback);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HitchRideRatingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HitchRideRatingState(...).copyWith(id: 12, name: "My name")
  /// ````
  HitchRideRatingState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? star = const $CopyWithPlaceholder(),
    Object? feedback = const $CopyWithPlaceholder(),
  }) {
    return HitchRideRatingState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      star: star == const $CopyWithPlaceholder()
          ? _value.star
          // ignore: cast_nullable_to_non_nullable
          : star as int?,
      feedback: feedback == const $CopyWithPlaceholder()
          ? _value.feedback
          // ignore: cast_nullable_to_non_nullable
          : feedback as String?,
    );
  }
}

extension $HitchRideRatingStateCopyWith on HitchRideRatingState {
  /// Returns a callable class that can be used as follows: `instanceOfHitchRideRatingState.copyWith(...)` or like so:`instanceOfHitchRideRatingState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HitchRideRatingStateCWProxy get copyWith =>
      _$HitchRideRatingStateCWProxyImpl(this);
}
