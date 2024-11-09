// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hitch_ride_pick_location_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HitchRidePickLocationStateCWProxy {
  HitchRidePickLocationState isLoading(bool isLoading);

  HitchRidePickLocationState locationList(List<OptionItem> locationList);

  HitchRidePickLocationState dataChange(bool dataChange);

  HitchRidePickLocationState selectedButtonIndex(int selectedButtonIndex);

  HitchRidePickLocationState autocompleteList(
      List<AutocompleteOutput> autocompleteList);

  HitchRidePickLocationState edittingIndex(int? edittingIndex);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HitchRidePickLocationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HitchRidePickLocationState(...).copyWith(id: 12, name: "My name")
  /// ````
  HitchRidePickLocationState call({
    bool? isLoading,
    List<OptionItem>? locationList,
    bool? dataChange,
    int? selectedButtonIndex,
    List<AutocompleteOutput>? autocompleteList,
    int? edittingIndex,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHitchRidePickLocationState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHitchRidePickLocationState.copyWith.fieldName(...)`
class _$HitchRidePickLocationStateCWProxyImpl
    implements _$HitchRidePickLocationStateCWProxy {
  const _$HitchRidePickLocationStateCWProxyImpl(this._value);

  final HitchRidePickLocationState _value;

  @override
  HitchRidePickLocationState isLoading(bool isLoading) =>
      this(isLoading: isLoading);

  @override
  HitchRidePickLocationState locationList(List<OptionItem> locationList) =>
      this(locationList: locationList);

  @override
  HitchRidePickLocationState dataChange(bool dataChange) =>
      this(dataChange: dataChange);

  @override
  HitchRidePickLocationState selectedButtonIndex(int selectedButtonIndex) =>
      this(selectedButtonIndex: selectedButtonIndex);

  @override
  HitchRidePickLocationState autocompleteList(
          List<AutocompleteOutput> autocompleteList) =>
      this(autocompleteList: autocompleteList);

  @override
  HitchRidePickLocationState edittingIndex(int? edittingIndex) =>
      this(edittingIndex: edittingIndex);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HitchRidePickLocationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HitchRidePickLocationState(...).copyWith(id: 12, name: "My name")
  /// ````
  HitchRidePickLocationState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? locationList = const $CopyWithPlaceholder(),
    Object? dataChange = const $CopyWithPlaceholder(),
    Object? selectedButtonIndex = const $CopyWithPlaceholder(),
    Object? autocompleteList = const $CopyWithPlaceholder(),
    Object? edittingIndex = const $CopyWithPlaceholder(),
  }) {
    return HitchRidePickLocationState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      locationList:
          locationList == const $CopyWithPlaceholder() || locationList == null
              ? _value.locationList
              // ignore: cast_nullable_to_non_nullable
              : locationList as List<OptionItem>,
      dataChange:
          dataChange == const $CopyWithPlaceholder() || dataChange == null
              ? _value.dataChange
              // ignore: cast_nullable_to_non_nullable
              : dataChange as bool,
      selectedButtonIndex:
          selectedButtonIndex == const $CopyWithPlaceholder() ||
                  selectedButtonIndex == null
              ? _value.selectedButtonIndex
              // ignore: cast_nullable_to_non_nullable
              : selectedButtonIndex as int,
      autocompleteList: autocompleteList == const $CopyWithPlaceholder() ||
              autocompleteList == null
          ? _value.autocompleteList
          // ignore: cast_nullable_to_non_nullable
          : autocompleteList as List<AutocompleteOutput>,
      edittingIndex: edittingIndex == const $CopyWithPlaceholder()
          ? _value.edittingIndex
          // ignore: cast_nullable_to_non_nullable
          : edittingIndex as int?,
    );
  }
}

extension $HitchRidePickLocationStateCopyWith on HitchRidePickLocationState {
  /// Returns a callable class that can be used as follows: `instanceOfHitchRidePickLocationState.copyWith(...)` or like so:`instanceOfHitchRidePickLocationState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HitchRidePickLocationStateCWProxy get copyWith =>
      _$HitchRidePickLocationStateCWProxyImpl(this);
}
