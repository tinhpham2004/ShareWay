// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hitch_ride_recommendation_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HitchRideRecommendationStateCWProxy {
  HitchRideRecommendationState isLoading(bool isLoading);

  HitchRideRecommendationState dataChange(bool dataChange);

  HitchRideRecommendationState giveRideRecommendationList(
      List<GiveRideRecommendationOuput> giveRideRecommendationList);

  HitchRideRecommendationState hitchRideId(String? hitchRideId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HitchRideRecommendationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HitchRideRecommendationState(...).copyWith(id: 12, name: "My name")
  /// ````
  HitchRideRecommendationState call({
    bool? isLoading,
    bool? dataChange,
    List<GiveRideRecommendationOuput>? giveRideRecommendationList,
    String? hitchRideId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHitchRideRecommendationState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHitchRideRecommendationState.copyWith.fieldName(...)`
class _$HitchRideRecommendationStateCWProxyImpl
    implements _$HitchRideRecommendationStateCWProxy {
  const _$HitchRideRecommendationStateCWProxyImpl(this._value);

  final HitchRideRecommendationState _value;

  @override
  HitchRideRecommendationState isLoading(bool isLoading) =>
      this(isLoading: isLoading);

  @override
  HitchRideRecommendationState dataChange(bool dataChange) =>
      this(dataChange: dataChange);

  @override
  HitchRideRecommendationState giveRideRecommendationList(
          List<GiveRideRecommendationOuput> giveRideRecommendationList) =>
      this(giveRideRecommendationList: giveRideRecommendationList);

  @override
  HitchRideRecommendationState hitchRideId(String? hitchRideId) =>
      this(hitchRideId: hitchRideId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HitchRideRecommendationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HitchRideRecommendationState(...).copyWith(id: 12, name: "My name")
  /// ````
  HitchRideRecommendationState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? dataChange = const $CopyWithPlaceholder(),
    Object? giveRideRecommendationList = const $CopyWithPlaceholder(),
    Object? hitchRideId = const $CopyWithPlaceholder(),
  }) {
    return HitchRideRecommendationState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      dataChange:
          dataChange == const $CopyWithPlaceholder() || dataChange == null
              ? _value.dataChange
              // ignore: cast_nullable_to_non_nullable
              : dataChange as bool,
      giveRideRecommendationList:
          giveRideRecommendationList == const $CopyWithPlaceholder() ||
                  giveRideRecommendationList == null
              ? _value.giveRideRecommendationList
              // ignore: cast_nullable_to_non_nullable
              : giveRideRecommendationList as List<GiveRideRecommendationOuput>,
      hitchRideId: hitchRideId == const $CopyWithPlaceholder()
          ? _value.hitchRideId
          // ignore: cast_nullable_to_non_nullable
          : hitchRideId as String?,
    );
  }
}

extension $HitchRideRecommendationStateCopyWith
    on HitchRideRecommendationState {
  /// Returns a callable class that can be used as follows: `instanceOfHitchRideRecommendationState.copyWith(...)` or like so:`instanceOfHitchRideRecommendationState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HitchRideRecommendationStateCWProxy get copyWith =>
      _$HitchRideRecommendationStateCWProxyImpl(this);
}
