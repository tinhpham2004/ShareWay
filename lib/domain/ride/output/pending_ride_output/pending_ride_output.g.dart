// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_ride_output.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PendingRideOutputCWProxy {
  PendingRideOutput pendingRideRequest(
      List<HitchRideRecommendationOuput>? pendingRideRequest);

  PendingRideOutput pendingRideOffer(
      List<GiveRideRecommendationOuput>? pendingRideOffer);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PendingRideOutput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PendingRideOutput(...).copyWith(id: 12, name: "My name")
  /// ````
  PendingRideOutput call({
    List<HitchRideRecommendationOuput>? pendingRideRequest,
    List<GiveRideRecommendationOuput>? pendingRideOffer,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPendingRideOutput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPendingRideOutput.copyWith.fieldName(...)`
class _$PendingRideOutputCWProxyImpl implements _$PendingRideOutputCWProxy {
  const _$PendingRideOutputCWProxyImpl(this._value);

  final PendingRideOutput _value;

  @override
  PendingRideOutput pendingRideRequest(
          List<HitchRideRecommendationOuput>? pendingRideRequest) =>
      this(pendingRideRequest: pendingRideRequest);

  @override
  PendingRideOutput pendingRideOffer(
          List<GiveRideRecommendationOuput>? pendingRideOffer) =>
      this(pendingRideOffer: pendingRideOffer);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PendingRideOutput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PendingRideOutput(...).copyWith(id: 12, name: "My name")
  /// ````
  PendingRideOutput call({
    Object? pendingRideRequest = const $CopyWithPlaceholder(),
    Object? pendingRideOffer = const $CopyWithPlaceholder(),
  }) {
    return PendingRideOutput(
      pendingRideRequest: pendingRideRequest == const $CopyWithPlaceholder()
          ? _value.pendingRideRequest
          // ignore: cast_nullable_to_non_nullable
          : pendingRideRequest as List<HitchRideRecommendationOuput>?,
      pendingRideOffer: pendingRideOffer == const $CopyWithPlaceholder()
          ? _value.pendingRideOffer
          // ignore: cast_nullable_to_non_nullable
          : pendingRideOffer as List<GiveRideRecommendationOuput>?,
    );
  }
}

extension $PendingRideOutputCopyWith on PendingRideOutput {
  /// Returns a callable class that can be used as follows: `instanceOfPendingRideOutput.copyWith(...)` or like so:`instanceOfPendingRideOutput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PendingRideOutputCWProxy get copyWith =>
      _$PendingRideOutputCWProxyImpl(this);
}
