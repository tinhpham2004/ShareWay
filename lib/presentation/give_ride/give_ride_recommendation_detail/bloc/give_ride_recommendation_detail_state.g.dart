// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'give_ride_recommendation_detail_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GiveRideRecommendationDetailStateCWProxy {
  GiveRideRecommendationDetailState isLoading(bool isLoading);

  GiveRideRecommendationDetailState mapboxMap(MapboxMap? mapboxMap);

  GiveRideRecommendationDetailState currentLocation(Geocode? currentLocation);

  GiveRideRecommendationDetailState hitchRideRecommendationOuput(
      HitchRideRecommendationOuput? hitchRideRecommendationOuput);

  GiveRideRecommendationDetailState coordinates(List<List<double>> coordinates);

  GiveRideRecommendationDetailState user(AppUser? user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GiveRideRecommendationDetailState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GiveRideRecommendationDetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  GiveRideRecommendationDetailState call({
    bool? isLoading,
    MapboxMap? mapboxMap,
    Geocode? currentLocation,
    HitchRideRecommendationOuput? hitchRideRecommendationOuput,
    List<List<double>>? coordinates,
    AppUser? user,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGiveRideRecommendationDetailState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGiveRideRecommendationDetailState.copyWith.fieldName(...)`
class _$GiveRideRecommendationDetailStateCWProxyImpl
    implements _$GiveRideRecommendationDetailStateCWProxy {
  const _$GiveRideRecommendationDetailStateCWProxyImpl(this._value);

  final GiveRideRecommendationDetailState _value;

  @override
  GiveRideRecommendationDetailState isLoading(bool isLoading) =>
      this(isLoading: isLoading);

  @override
  GiveRideRecommendationDetailState mapboxMap(MapboxMap? mapboxMap) =>
      this(mapboxMap: mapboxMap);

  @override
  GiveRideRecommendationDetailState currentLocation(Geocode? currentLocation) =>
      this(currentLocation: currentLocation);

  @override
  GiveRideRecommendationDetailState hitchRideRecommendationOuput(
          HitchRideRecommendationOuput? hitchRideRecommendationOuput) =>
      this(hitchRideRecommendationOuput: hitchRideRecommendationOuput);

  @override
  GiveRideRecommendationDetailState coordinates(
          List<List<double>> coordinates) =>
      this(coordinates: coordinates);

  @override
  GiveRideRecommendationDetailState user(AppUser? user) => this(user: user);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GiveRideRecommendationDetailState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GiveRideRecommendationDetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  GiveRideRecommendationDetailState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? mapboxMap = const $CopyWithPlaceholder(),
    Object? currentLocation = const $CopyWithPlaceholder(),
    Object? hitchRideRecommendationOuput = const $CopyWithPlaceholder(),
    Object? coordinates = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return GiveRideRecommendationDetailState(
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

extension $GiveRideRecommendationDetailStateCopyWith
    on GiveRideRecommendationDetailState {
  /// Returns a callable class that can be used as follows: `instanceOfGiveRideRecommendationDetailState.copyWith(...)` or like so:`instanceOfGiveRideRecommendationDetailState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GiveRideRecommendationDetailStateCWProxy get copyWith =>
      _$GiveRideRecommendationDetailStateCWProxyImpl(this);
}
