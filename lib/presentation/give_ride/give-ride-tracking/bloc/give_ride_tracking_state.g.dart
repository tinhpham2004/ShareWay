// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'give_ride_tracking_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GiveRideTrackingStateCWProxy {
  GiveRideTrackingState isLoading(bool isLoading);

  GiveRideTrackingState mapboxMap(MapboxMap? mapboxMap);

  GiveRideTrackingState currentLocation(Geocode? currentLocation);

  GiveRideTrackingState hitchRideRecommendationOuput(
      HitchRideRecommendationOuput? hitchRideRecommendationOuput);

  GiveRideTrackingState coordinates(List<List<double>> coordinates);

  GiveRideTrackingState user(AppUser? user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GiveRideTrackingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GiveRideTrackingState(...).copyWith(id: 12, name: "My name")
  /// ````
  GiveRideTrackingState call({
    bool? isLoading,
    MapboxMap? mapboxMap,
    Geocode? currentLocation,
    HitchRideRecommendationOuput? hitchRideRecommendationOuput,
    List<List<double>>? coordinates,
    AppUser? user,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGiveRideTrackingState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGiveRideTrackingState.copyWith.fieldName(...)`
class _$GiveRideTrackingStateCWProxyImpl
    implements _$GiveRideTrackingStateCWProxy {
  const _$GiveRideTrackingStateCWProxyImpl(this._value);

  final GiveRideTrackingState _value;

  @override
  GiveRideTrackingState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  GiveRideTrackingState mapboxMap(MapboxMap? mapboxMap) =>
      this(mapboxMap: mapboxMap);

  @override
  GiveRideTrackingState currentLocation(Geocode? currentLocation) =>
      this(currentLocation: currentLocation);

  @override
  GiveRideTrackingState hitchRideRecommendationOuput(
          HitchRideRecommendationOuput? hitchRideRecommendationOuput) =>
      this(hitchRideRecommendationOuput: hitchRideRecommendationOuput);

  @override
  GiveRideTrackingState coordinates(List<List<double>> coordinates) =>
      this(coordinates: coordinates);

  @override
  GiveRideTrackingState user(AppUser? user) => this(user: user);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GiveRideTrackingState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GiveRideTrackingState(...).copyWith(id: 12, name: "My name")
  /// ````
  GiveRideTrackingState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? mapboxMap = const $CopyWithPlaceholder(),
    Object? currentLocation = const $CopyWithPlaceholder(),
    Object? hitchRideRecommendationOuput = const $CopyWithPlaceholder(),
    Object? coordinates = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return GiveRideTrackingState(
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
      hitchRideRecommendationOuput:
          hitchRideRecommendationOuput == const $CopyWithPlaceholder()
              ? _value.hitchRideRecommendationOuput
              // ignore: cast_nullable_to_non_nullable
              : hitchRideRecommendationOuput as HitchRideRecommendationOuput?,
      coordinates:
          coordinates == const $CopyWithPlaceholder() || coordinates == null
              ? _value.coordinates
              // ignore: cast_nullable_to_non_nullable
              : coordinates as List<List<double>>,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as AppUser?,
    );
  }
}

extension $GiveRideTrackingStateCopyWith on GiveRideTrackingState {
  /// Returns a callable class that can be used as follows: `instanceOfGiveRideTrackingState.copyWith(...)` or like so:`instanceOfGiveRideTrackingState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GiveRideTrackingStateCWProxy get copyWith =>
      _$GiveRideTrackingStateCWProxyImpl(this);
}
