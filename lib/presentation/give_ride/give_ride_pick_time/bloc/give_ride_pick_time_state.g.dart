// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'give_ride_pick_time_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GiveRidePickTimeStateCWProxy {
  GiveRidePickTimeState isLoading(bool isLoading);

  GiveRidePickTimeState createGiveRideInput(
      CreateGiveRideInput? createGiveRideInput);

  GiveRidePickTimeState timeList(List<String> timeList);

  GiveRidePickTimeState dataChange(bool dataChange);

  GiveRidePickTimeState selectedRadioIndex(int selectedRadioIndex);

  GiveRidePickTimeState selectedDateTime(DateTime? selectedDateTime);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GiveRidePickTimeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GiveRidePickTimeState(...).copyWith(id: 12, name: "My name")
  /// ````
  GiveRidePickTimeState call({
    bool? isLoading,
    CreateGiveRideInput? createGiveRideInput,
    List<String>? timeList,
    bool? dataChange,
    int? selectedRadioIndex,
    DateTime? selectedDateTime,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGiveRidePickTimeState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGiveRidePickTimeState.copyWith.fieldName(...)`
class _$GiveRidePickTimeStateCWProxyImpl
    implements _$GiveRidePickTimeStateCWProxy {
  const _$GiveRidePickTimeStateCWProxyImpl(this._value);

  final GiveRidePickTimeState _value;

  @override
  GiveRidePickTimeState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  GiveRidePickTimeState createGiveRideInput(
          CreateGiveRideInput? createGiveRideInput) =>
      this(createGiveRideInput: createGiveRideInput);

  @override
  GiveRidePickTimeState timeList(List<String> timeList) =>
      this(timeList: timeList);

  @override
  GiveRidePickTimeState dataChange(bool dataChange) =>
      this(dataChange: dataChange);

  @override
  GiveRidePickTimeState selectedRadioIndex(int selectedRadioIndex) =>
      this(selectedRadioIndex: selectedRadioIndex);

  @override
  GiveRidePickTimeState selectedDateTime(DateTime? selectedDateTime) =>
      this(selectedDateTime: selectedDateTime);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GiveRidePickTimeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GiveRidePickTimeState(...).copyWith(id: 12, name: "My name")
  /// ````
  GiveRidePickTimeState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? createGiveRideInput = const $CopyWithPlaceholder(),
    Object? timeList = const $CopyWithPlaceholder(),
    Object? dataChange = const $CopyWithPlaceholder(),
    Object? selectedRadioIndex = const $CopyWithPlaceholder(),
    Object? selectedDateTime = const $CopyWithPlaceholder(),
  }) {
    return GiveRidePickTimeState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      createGiveRideInput: createGiveRideInput == const $CopyWithPlaceholder()
          ? _value.createGiveRideInput
          // ignore: cast_nullable_to_non_nullable
          : createGiveRideInput as CreateGiveRideInput?,
      timeList: timeList == const $CopyWithPlaceholder() || timeList == null
          ? _value.timeList
          // ignore: cast_nullable_to_non_nullable
          : timeList as List<String>,
      dataChange:
          dataChange == const $CopyWithPlaceholder() || dataChange == null
              ? _value.dataChange
              // ignore: cast_nullable_to_non_nullable
              : dataChange as bool,
      selectedRadioIndex: selectedRadioIndex == const $CopyWithPlaceholder() ||
              selectedRadioIndex == null
          ? _value.selectedRadioIndex
          // ignore: cast_nullable_to_non_nullable
          : selectedRadioIndex as int,
      selectedDateTime: selectedDateTime == const $CopyWithPlaceholder()
          ? _value.selectedDateTime
          // ignore: cast_nullable_to_non_nullable
          : selectedDateTime as DateTime?,
    );
  }
}

extension $GiveRidePickTimeStateCopyWith on GiveRidePickTimeState {
  /// Returns a callable class that can be used as follows: `instanceOfGiveRidePickTimeState.copyWith(...)` or like so:`instanceOfGiveRidePickTimeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GiveRidePickTimeStateCWProxy get copyWith =>
      _$GiveRidePickTimeStateCWProxyImpl(this);
}
