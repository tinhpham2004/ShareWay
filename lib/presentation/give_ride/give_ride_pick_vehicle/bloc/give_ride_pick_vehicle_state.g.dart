// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'give_ride_pick_vehicle_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GiveRidePickVehicleStateCWProxy {
  GiveRidePickVehicleState isLoading(bool isLoading);

  GiveRidePickVehicleState dataChange(bool dataChange);

  GiveRidePickVehicleState vehicles(List<GetVehicleOuput> vehicles);

  GiveRidePickVehicleState selectedVehicleIndex(int selectedVehicleIndex);

  GiveRidePickVehicleState createGiveRideInput(
      CreateGiveRideInput? createGiveRideInput);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GiveRidePickVehicleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GiveRidePickVehicleState(...).copyWith(id: 12, name: "My name")
  /// ````
  GiveRidePickVehicleState call({
    bool? isLoading,
    bool? dataChange,
    List<GetVehicleOuput>? vehicles,
    int? selectedVehicleIndex,
    CreateGiveRideInput? createGiveRideInput,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGiveRidePickVehicleState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGiveRidePickVehicleState.copyWith.fieldName(...)`
class _$GiveRidePickVehicleStateCWProxyImpl
    implements _$GiveRidePickVehicleStateCWProxy {
  const _$GiveRidePickVehicleStateCWProxyImpl(this._value);

  final GiveRidePickVehicleState _value;

  @override
  GiveRidePickVehicleState isLoading(bool isLoading) =>
      this(isLoading: isLoading);

  @override
  GiveRidePickVehicleState dataChange(bool dataChange) =>
      this(dataChange: dataChange);

  @override
  GiveRidePickVehicleState vehicles(List<GetVehicleOuput> vehicles) =>
      this(vehicles: vehicles);

  @override
  GiveRidePickVehicleState selectedVehicleIndex(int selectedVehicleIndex) =>
      this(selectedVehicleIndex: selectedVehicleIndex);

  @override
  GiveRidePickVehicleState createGiveRideInput(
          CreateGiveRideInput? createGiveRideInput) =>
      this(createGiveRideInput: createGiveRideInput);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GiveRidePickVehicleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GiveRidePickVehicleState(...).copyWith(id: 12, name: "My name")
  /// ````
  GiveRidePickVehicleState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? dataChange = const $CopyWithPlaceholder(),
    Object? vehicles = const $CopyWithPlaceholder(),
    Object? selectedVehicleIndex = const $CopyWithPlaceholder(),
    Object? createGiveRideInput = const $CopyWithPlaceholder(),
  }) {
    return GiveRidePickVehicleState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      dataChange:
          dataChange == const $CopyWithPlaceholder() || dataChange == null
              ? _value.dataChange
              // ignore: cast_nullable_to_non_nullable
              : dataChange as bool,
      vehicles: vehicles == const $CopyWithPlaceholder() || vehicles == null
          ? _value.vehicles
          // ignore: cast_nullable_to_non_nullable
          : vehicles as List<GetVehicleOuput>,
      selectedVehicleIndex:
          selectedVehicleIndex == const $CopyWithPlaceholder() ||
                  selectedVehicleIndex == null
              ? _value.selectedVehicleIndex
              // ignore: cast_nullable_to_non_nullable
              : selectedVehicleIndex as int,
      createGiveRideInput: createGiveRideInput == const $CopyWithPlaceholder()
          ? _value.createGiveRideInput
          // ignore: cast_nullable_to_non_nullable
          : createGiveRideInput as CreateGiveRideInput?,
    );
  }
}

extension $GiveRidePickVehicleStateCopyWith on GiveRidePickVehicleState {
  /// Returns a callable class that can be used as follows: `instanceOfGiveRidePickVehicleState.copyWith(...)` or like so:`instanceOfGiveRidePickVehicleState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GiveRidePickVehicleStateCWProxy get copyWith =>
      _$GiveRidePickVehicleStateCWProxyImpl(this);
}
