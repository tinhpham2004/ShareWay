// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hitch_ride_recommendation_detail_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HitchRideRecommendationDetailStateCWProxy {
  HitchRideRecommendationDetailState isLoading(bool isLoading);

  HitchRideRecommendationDetailState mapboxMap(MapboxMap? mapboxMap);

  HitchRideRecommendationDetailState currentLocation(Geocode? currentLocation);

  HitchRideRecommendationDetailState giveRideRecommendationOuput(
      GiveRideRecommendationOuput? giveRideRecommendationOuput);

  HitchRideRecommendationDetailState coordinates(
      List<List<double>> coordinates);

  HitchRideRecommendationDetailState user(AppUser? user);

  HitchRideRecommendationDetailState userPointAnnotationManager(
      PointAnnotationManager? userPointAnnotationManager);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HitchRideRecommendationDetailState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HitchRideRecommendationDetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  HitchRideRecommendationDetailState call({
    bool? isLoading,
    MapboxMap? mapboxMap,
    Geocode? currentLocation,
    GiveRideRecommendationOuput? giveRideRecommendationOuput,
    List<List<double>>? coordinates,
    AppUser? user,
    PointAnnotationManager? userPointAnnotationManager,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHitchRideRecommendationDetailState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHitchRideRecommendationDetailState.copyWith.fieldName(...)`
class _$HitchRideRecommendationDetailStateCWProxyImpl
    implements _$HitchRideRecommendationDetailStateCWProxy {
  const _$HitchRideRecommendationDetailStateCWProxyImpl(this._value);

  final HitchRideRecommendationDetailState _value;

  @override
  HitchRideRecommendationDetailState isLoading(bool isLoading) =>
      this(isLoading: isLoading);

  @override
  HitchRideRecommendationDetailState mapboxMap(MapboxMap? mapboxMap) =>
      this(mapboxMap: mapboxMap);

  @override
  HitchRideRecommendationDetailState currentLocation(
          Geocode? currentLocation) =>
      this(currentLocation: currentLocation);

  @override
  HitchRideRecommendationDetailState giveRideRecommendationOuput(
          GiveRideRecommendationOuput? giveRideRecommendationOuput) =>
      this(giveRideRecommendationOuput: giveRideRecommendationOuput);

  @override
  HitchRideRecommendationDetailState coordinates(
          List<List<double>> coordinates) =>
      this(coordinates: coordinates);

  @override
  HitchRideRecommendationDetailState user(AppUser? user) => this(user: user);

  @override
  HitchRideRecommendationDetailState userPointAnnotationManager(
          PointAnnotationManager? userPointAnnotationManager) =>
      this(userPointAnnotationManager: userPointAnnotationManager);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HitchRideRecommendationDetailState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HitchRideRecommendationDetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  HitchRideRecommendationDetailState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? mapboxMap = const $CopyWithPlaceholder(),
    Object? currentLocation = const $CopyWithPlaceholder(),
    Object? giveRideRecommendationOuput = const $CopyWithPlaceholder(),
    Object? coordinates = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
    Object? userPointAnnotationManager = const $CopyWithPlaceholder(),
  }) {
    return HitchRideRecommendationDetailState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      mapboxMap: mapboxMap == const $CopyWithPlaceholder()
          ? _value.mapboxMap
          // ignore: cast_nullable_to_non_nullable
          : mapboxMap as MapboxMap?,
      currentLocation: currentLocation == const $CopyWithPlaceholder()
          ? _value.currentLocation
          // ignore: cast_nullable_to_non_nullable
          : currentLocation as Geocode?,
      giveRideRecommendationOuput:
          giveRideRecommendationOuput == const $CopyWithPlaceholder()
              ? _value.giveRideRecommendationOuput
              // ignore: cast_nullable_to_non_nullable
              : giveRideRecommendationOuput as GiveRideRecommendationOuput?,
      coordinates:
          coordinates == const $CopyWithPlaceholder() || coordinates == null
              ? _value.coordinates
              // ignore: cast_nullable_to_non_nullable
              : coordinates as List<List<double>>,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as AppUser?,
      userPointAnnotationManager:
          userPointAnnotationManager == const $CopyWithPlaceholder()
              ? _value.userPointAnnotationManager
              // ignore: cast_nullable_to_non_nullable
              : userPointAnnotationManager as PointAnnotationManager?,
    );
  }
}

extension $HitchRideRecommendationDetailStateCopyWith
    on HitchRideRecommendationDetailState {
  /// Returns a callable class that can be used as follows: `instanceOfHitchRideRecommendationDetailState.copyWith(...)` or like so:`instanceOfHitchRideRecommendationDetailState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HitchRideRecommendationDetailStateCWProxy get copyWith =>
      _$HitchRideRecommendationDetailStateCWProxyImpl(this);
}
