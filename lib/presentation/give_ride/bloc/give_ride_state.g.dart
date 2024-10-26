// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'give_ride_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GiveRideStateCWProxy {
  GiveRideState isLoading(bool isLoading);

  GiveRideState locationList(List<OptionItem> locationList);

  GiveRideState dataChange(bool dataChange);

  GiveRideState selectedButtonIndex(int selectedButtonIndex);

  GiveRideState autocompleteList(List<AutocompleteOutput> autocompleteList);

  GiveRideState edittingIndex(int? edittingIndex);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GiveRideState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GiveRideState(...).copyWith(id: 12, name: "My name")
  /// ````
  GiveRideState call({
    bool? isLoading,
    List<OptionItem>? locationList,
    bool? dataChange,
    int? selectedButtonIndex,
    List<AutocompleteOutput>? autocompleteList,
    int? edittingIndex,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGiveRideState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGiveRideState.copyWith.fieldName(...)`
class _$GiveRideStateCWProxyImpl implements _$GiveRideStateCWProxy {
  const _$GiveRideStateCWProxyImpl(this._value);

  final GiveRideState _value;

  @override
  GiveRideState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  GiveRideState locationList(List<OptionItem> locationList) =>
      this(locationList: locationList);

  @override
  GiveRideState dataChange(bool dataChange) => this(dataChange: dataChange);

  @override
  GiveRideState selectedButtonIndex(int selectedButtonIndex) =>
      this(selectedButtonIndex: selectedButtonIndex);

  @override
  GiveRideState autocompleteList(List<AutocompleteOutput> autocompleteList) =>
      this(autocompleteList: autocompleteList);

  @override
  GiveRideState edittingIndex(int? edittingIndex) =>
      this(edittingIndex: edittingIndex);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GiveRideState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GiveRideState(...).copyWith(id: 12, name: "My name")
  /// ````
  GiveRideState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? locationList = const $CopyWithPlaceholder(),
    Object? dataChange = const $CopyWithPlaceholder(),
    Object? selectedButtonIndex = const $CopyWithPlaceholder(),
    Object? autocompleteList = const $CopyWithPlaceholder(),
    Object? edittingIndex = const $CopyWithPlaceholder(),
  }) {
    return GiveRideState(
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

extension $GiveRideStateCopyWith on GiveRideState {
  /// Returns a callable class that can be used as follows: `instanceOfGiveRideState.copyWith(...)` or like so:`instanceOfGiveRideState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GiveRideStateCWProxy get copyWith => _$GiveRideStateCWProxyImpl(this);
}
