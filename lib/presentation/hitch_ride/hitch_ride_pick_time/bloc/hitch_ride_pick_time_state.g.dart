// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hitch_ride_pick_time_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HitchRidePickTimeStateCWProxy {
  HitchRidePickTimeState isLoading(bool isLoading);

  HitchRidePickTimeState createHitchRideInput(
      CreateHitchRideInput? createHitchRideInput);

  HitchRidePickTimeState timeList(List<String> timeList);

  HitchRidePickTimeState dataChange(bool dataChange);

  HitchRidePickTimeState selectedRadioIndex(int selectedRadioIndex);

  HitchRidePickTimeState selectedDateTime(DateTime? selectedDateTime);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HitchRidePickTimeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HitchRidePickTimeState(...).copyWith(id: 12, name: "My name")
  /// ````
  HitchRidePickTimeState call({
    bool? isLoading,
    CreateHitchRideInput? createHitchRideInput,
    List<String>? timeList,
    bool? dataChange,
    int? selectedRadioIndex,
    DateTime? selectedDateTime,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHitchRidePickTimeState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHitchRidePickTimeState.copyWith.fieldName(...)`
class _$HitchRidePickTimeStateCWProxyImpl
    implements _$HitchRidePickTimeStateCWProxy {
  const _$HitchRidePickTimeStateCWProxyImpl(this._value);

  final HitchRidePickTimeState _value;

  @override
  HitchRidePickTimeState isLoading(bool isLoading) =>
      this(isLoading: isLoading);

  @override
  HitchRidePickTimeState createHitchRideInput(
          CreateHitchRideInput? createHitchRideInput) =>
      this(createHitchRideInput: createHitchRideInput);

  @override
  HitchRidePickTimeState timeList(List<String> timeList) =>
      this(timeList: timeList);

  @override
  HitchRidePickTimeState dataChange(bool dataChange) =>
      this(dataChange: dataChange);

  @override
  HitchRidePickTimeState selectedRadioIndex(int selectedRadioIndex) =>
      this(selectedRadioIndex: selectedRadioIndex);

  @override
  HitchRidePickTimeState selectedDateTime(DateTime? selectedDateTime) =>
      this(selectedDateTime: selectedDateTime);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HitchRidePickTimeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HitchRidePickTimeState(...).copyWith(id: 12, name: "My name")
  /// ````
  HitchRidePickTimeState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? createHitchRideInput = const $CopyWithPlaceholder(),
    Object? timeList = const $CopyWithPlaceholder(),
    Object? dataChange = const $CopyWithPlaceholder(),
    Object? selectedRadioIndex = const $CopyWithPlaceholder(),
    Object? selectedDateTime = const $CopyWithPlaceholder(),
  }) {
    return HitchRidePickTimeState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      createHitchRideInput: createHitchRideInput == const $CopyWithPlaceholder()
          ? _value.createHitchRideInput
          // ignore: cast_nullable_to_non_nullable
          : createHitchRideInput as CreateHitchRideInput?,
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

extension $HitchRidePickTimeStateCopyWith on HitchRidePickTimeState {
  /// Returns a callable class that can be used as follows: `instanceOfHitchRidePickTimeState.copyWith(...)` or like so:`instanceOfHitchRidePickTimeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HitchRidePickTimeStateCWProxy get copyWith =>
      _$HitchRidePickTimeStateCWProxyImpl(this);
}
