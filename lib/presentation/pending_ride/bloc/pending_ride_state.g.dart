// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_ride_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PendingRideStateCWProxy {
  PendingRideState isLoading(bool isLoading);

  PendingRideState dataChange(bool dataChange);

  PendingRideState pendingRideRequest(
      List<HitchRideRecommendationOuput> pendingRideRequest);

  PendingRideState pendingRideOffer(
      List<GiveRideRecommendationOuput> pendingRideOffer);

  PendingRideState selectedButtonIndex(int selectedButtonIndex);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PendingRideState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PendingRideState(...).copyWith(id: 12, name: "My name")
  /// ````
  PendingRideState call({
    bool? isLoading,
    bool? dataChange,
    List<HitchRideRecommendationOuput>? pendingRideRequest,
    List<GiveRideRecommendationOuput>? pendingRideOffer,
    int? selectedButtonIndex,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPendingRideState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPendingRideState.copyWith.fieldName(...)`
class _$PendingRideStateCWProxyImpl implements _$PendingRideStateCWProxy {
  const _$PendingRideStateCWProxyImpl(this._value);

  final PendingRideState _value;

  @override
  PendingRideState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  PendingRideState dataChange(bool dataChange) => this(dataChange: dataChange);

  @override
  PendingRideState pendingRideRequest(
          List<HitchRideRecommendationOuput> pendingRideRequest) =>
      this(pendingRideRequest: pendingRideRequest);

  @override
  PendingRideState pendingRideOffer(
          List<GiveRideRecommendationOuput> pendingRideOffer) =>
      this(pendingRideOffer: pendingRideOffer);

  @override
  PendingRideState selectedButtonIndex(int selectedButtonIndex) =>
      this(selectedButtonIndex: selectedButtonIndex);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PendingRideState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PendingRideState(...).copyWith(id: 12, name: "My name")
  /// ````
  PendingRideState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? dataChange = const $CopyWithPlaceholder(),
    Object? pendingRideRequest = const $CopyWithPlaceholder(),
    Object? pendingRideOffer = const $CopyWithPlaceholder(),
    Object? selectedButtonIndex = const $CopyWithPlaceholder(),
  }) {
    return PendingRideState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      dataChange:
          dataChange == const $CopyWithPlaceholder() || dataChange == null
              ? _value.dataChange
              // ignore: cast_nullable_to_non_nullable
              : dataChange as bool,
      pendingRideRequest: pendingRideRequest == const $CopyWithPlaceholder() ||
              pendingRideRequest == null
          ? _value.pendingRideRequest
          // ignore: cast_nullable_to_non_nullable
          : pendingRideRequest as List<HitchRideRecommendationOuput>,
      pendingRideOffer: pendingRideOffer == const $CopyWithPlaceholder() ||
              pendingRideOffer == null
          ? _value.pendingRideOffer
          // ignore: cast_nullable_to_non_nullable
          : pendingRideOffer as List<GiveRideRecommendationOuput>,
      selectedButtonIndex:
          selectedButtonIndex == const $CopyWithPlaceholder() ||
                  selectedButtonIndex == null
              ? _value.selectedButtonIndex
              // ignore: cast_nullable_to_non_nullable
              : selectedButtonIndex as int,
    );
  }
}

extension $PendingRideStateCopyWith on PendingRideState {
  /// Returns a callable class that can be used as follows: `instanceOfPendingRideState.copyWith(...)` or like so:`instanceOfPendingRideState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PendingRideStateCWProxy get copyWith => _$PendingRideStateCWProxyImpl(this);
}
