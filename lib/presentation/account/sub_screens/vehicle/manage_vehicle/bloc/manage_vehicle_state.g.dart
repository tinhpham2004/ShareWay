// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_vehicle_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ManageVehicleStateCWProxy {
  ManageVehicleState isLoading(bool isLoading);

  ManageVehicleState dataChange(bool dataChange);

  ManageVehicleState vehicles(List<GetVehicleOuput> vehicles);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ManageVehicleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ManageVehicleState(...).copyWith(id: 12, name: "My name")
  /// ````
  ManageVehicleState call({
    bool? isLoading,
    bool? dataChange,
    List<GetVehicleOuput>? vehicles,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfManageVehicleState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfManageVehicleState.copyWith.fieldName(...)`
class _$ManageVehicleStateCWProxyImpl implements _$ManageVehicleStateCWProxy {
  const _$ManageVehicleStateCWProxyImpl(this._value);

  final ManageVehicleState _value;

  @override
  ManageVehicleState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  ManageVehicleState dataChange(bool dataChange) =>
      this(dataChange: dataChange);

  @override
  ManageVehicleState vehicles(List<GetVehicleOuput> vehicles) =>
      this(vehicles: vehicles);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ManageVehicleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ManageVehicleState(...).copyWith(id: 12, name: "My name")
  /// ````
  ManageVehicleState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? dataChange = const $CopyWithPlaceholder(),
    Object? vehicles = const $CopyWithPlaceholder(),
  }) {
    return ManageVehicleState(
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
    );
  }
}

extension $ManageVehicleStateCopyWith on ManageVehicleState {
  /// Returns a callable class that can be used as follows: `instanceOfManageVehicleState.copyWith(...)` or like so:`instanceOfManageVehicleState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ManageVehicleStateCWProxy get copyWith =>
      _$ManageVehicleStateCWProxyImpl(this);
}
