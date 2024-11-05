// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'give_ride_preview_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GiveRidePreviewStateCWProxy {
  GiveRidePreviewState isLoading(bool isLoading);

  GiveRidePreviewState mapboxMap(MapboxMap? mapboxMap);

  GiveRidePreviewState currentLocation(Geocode? currentLocation);

  GiveRidePreviewState createGiveRideOutput(
      CreateGiveRideOutput? createGiveRideOutput);

  GiveRidePreviewState coordinates(List<List<double>> coordinates);

  GiveRidePreviewState selectedLocationIndex(int selectedLocationIndex);

  GiveRidePreviewState user(AppUser? user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GiveRidePreviewState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GiveRidePreviewState(...).copyWith(id: 12, name: "My name")
  /// ````
  GiveRidePreviewState call({
    bool? isLoading,
    MapboxMap? mapboxMap,
    Geocode? currentLocation,
    CreateGiveRideOutput? createGiveRideOutput,
    List<List<double>>? coordinates,
    int? selectedLocationIndex,
    AppUser? user,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGiveRidePreviewState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGiveRidePreviewState.copyWith.fieldName(...)`
class _$GiveRidePreviewStateCWProxyImpl
    implements _$GiveRidePreviewStateCWProxy {
  const _$GiveRidePreviewStateCWProxyImpl(this._value);

  final GiveRidePreviewState _value;

  @override
  GiveRidePreviewState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  GiveRidePreviewState mapboxMap(MapboxMap? mapboxMap) =>
      this(mapboxMap: mapboxMap);

  @override
  GiveRidePreviewState currentLocation(Geocode? currentLocation) =>
      this(currentLocation: currentLocation);

  @override
  GiveRidePreviewState createGiveRideOutput(
          CreateGiveRideOutput? createGiveRideOutput) =>
      this(createGiveRideOutput: createGiveRideOutput);

  @override
  GiveRidePreviewState coordinates(List<List<double>> coordinates) =>
      this(coordinates: coordinates);

  @override
  GiveRidePreviewState selectedLocationIndex(int selectedLocationIndex) =>
      this(selectedLocationIndex: selectedLocationIndex);

  @override
  GiveRidePreviewState user(AppUser? user) => this(user: user);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GiveRidePreviewState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GiveRidePreviewState(...).copyWith(id: 12, name: "My name")
  /// ````
  GiveRidePreviewState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? mapboxMap = const $CopyWithPlaceholder(),
    Object? currentLocation = const $CopyWithPlaceholder(),
    Object? createGiveRideOutput = const $CopyWithPlaceholder(),
    Object? coordinates = const $CopyWithPlaceholder(),
    Object? selectedLocationIndex = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return GiveRidePreviewState(
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
      createGiveRideOutput: createGiveRideOutput == const $CopyWithPlaceholder()
          ? _value.createGiveRideOutput
          // ignore: cast_nullable_to_non_nullable
          : createGiveRideOutput as CreateGiveRideOutput?,
      coordinates:
          coordinates == const $CopyWithPlaceholder() || coordinates == null
              ? _value.coordinates
              // ignore: cast_nullable_to_non_nullable
              : coordinates as List<List<double>>,
      selectedLocationIndex:
          selectedLocationIndex == const $CopyWithPlaceholder() ||
                  selectedLocationIndex == null
              ? _value.selectedLocationIndex
              // ignore: cast_nullable_to_non_nullable
              : selectedLocationIndex as int,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as AppUser?,
    );
  }
}

extension $GiveRidePreviewStateCopyWith on GiveRidePreviewState {
  /// Returns a callable class that can be used as follows: `instanceOfGiveRidePreviewState.copyWith(...)` or like so:`instanceOfGiveRidePreviewState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GiveRidePreviewStateCWProxy get copyWith =>
      _$GiveRidePreviewStateCWProxyImpl(this);
}
