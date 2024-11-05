// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'give_ride_pick_location_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GiveRidePickLocationStateCWProxy {
  GiveRidePickLocationState isLoading(bool isLoading);

  GiveRidePickLocationState locationList(List<OptionItem> locationList);

  GiveRidePickLocationState dataChange(bool dataChange);

  GiveRidePickLocationState selectedButtonIndex(int selectedButtonIndex);

  GiveRidePickLocationState autocompleteList(
      List<AutocompleteOutput> autocompleteList);

  GiveRidePickLocationState edittingIndex(int? edittingIndex);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GiveRidePickLocationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GiveRidePickLocationState(...).copyWith(id: 12, name: "My name")
  /// ````
  GiveRidePickLocationState call({
    bool? isLoading,
    List<OptionItem>? locationList,
    bool? dataChange,
    int? selectedButtonIndex,
    List<AutocompleteOutput>? autocompleteList,
    int? edittingIndex,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGiveRidePickLocationState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGiveRidePickLocationState.copyWith.fieldName(...)`
class _$GiveRidePickLocationStateCWProxyImpl
    implements _$GiveRidePickLocationStateCWProxy {
  const _$GiveRidePickLocationStateCWProxyImpl(this._value);

  final GiveRidePickLocationState _value;

  @override
  GiveRidePickLocationState isLoading(bool isLoading) =>
      this(isLoading: isLoading);

  @override
  GiveRidePickLocationState locationList(List<OptionItem> locationList) =>
      this(locationList: locationList);

  @override
  GiveRidePickLocationState dataChange(bool dataChange) =>
      this(dataChange: dataChange);

  @override
  GiveRidePickLocationState selectedButtonIndex(int selectedButtonIndex) =>
      this(selectedButtonIndex: selectedButtonIndex);

  @override
  GiveRidePickLocationState autocompleteList(
          List<AutocompleteOutput> autocompleteList) =>
      this(autocompleteList: autocompleteList);

  @override
  GiveRidePickLocationState edittingIndex(int? edittingIndex) =>
      this(edittingIndex: edittingIndex);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GiveRidePickLocationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GiveRidePickLocationState(...).copyWith(id: 12, name: "My name")
  /// ````
  GiveRidePickLocationState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? locationList = const $CopyWithPlaceholder(),
    Object? dataChange = const $CopyWithPlaceholder(),
    Object? selectedButtonIndex = const $CopyWithPlaceholder(),
    Object? autocompleteList = const $CopyWithPlaceholder(),
    Object? edittingIndex = const $CopyWithPlaceholder(),
  }) {
    return GiveRidePickLocationState(
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

extension $GiveRidePickLocationStateCopyWith on GiveRidePickLocationState {
  /// Returns a callable class that can be used as follows: `instanceOfGiveRidePickLocationState.copyWith(...)` or like so:`instanceOfGiveRidePickLocationState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GiveRidePickLocationStateCWProxy get copyWith =>
      _$GiveRidePickLocationStateCWProxyImpl(this);
}
