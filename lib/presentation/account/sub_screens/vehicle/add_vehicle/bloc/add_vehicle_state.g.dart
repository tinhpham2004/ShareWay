// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_vehicle_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddVehicleStateCWProxy {
  AddVehicleState isLoading(bool isLoading);

  AddVehicleState dataChange(bool dataChange);

  AddVehicleState vehicles(List<OptionItem> vehicles);

  AddVehicleState selectedVehicle(OptionItem? selectedVehicle);

  AddVehicleState licensePlate(String? licensePlate);

  AddVehicleState cavetNumber(String? cavetNumber);

  AddVehicleState pageSize(int pageSize);

  AddVehicleState pageKey(int pageKey);

  AddVehicleState hasMoreData(bool hasMoreData);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddVehicleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddVehicleState(...).copyWith(id: 12, name: "My name")
  /// ````
  AddVehicleState call({
    bool? isLoading,
    bool? dataChange,
    List<OptionItem>? vehicles,
    OptionItem? selectedVehicle,
    String? licensePlate,
    String? cavetNumber,
    int? pageSize,
    int? pageKey,
    bool? hasMoreData,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddVehicleState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddVehicleState.copyWith.fieldName(...)`
class _$AddVehicleStateCWProxyImpl implements _$AddVehicleStateCWProxy {
  const _$AddVehicleStateCWProxyImpl(this._value);

  final AddVehicleState _value;

  @override
  AddVehicleState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  AddVehicleState dataChange(bool dataChange) => this(dataChange: dataChange);

  @override
  AddVehicleState vehicles(List<OptionItem> vehicles) =>
      this(vehicles: vehicles);

  @override
  AddVehicleState selectedVehicle(OptionItem? selectedVehicle) =>
      this(selectedVehicle: selectedVehicle);

  @override
  AddVehicleState licensePlate(String? licensePlate) =>
      this(licensePlate: licensePlate);

  @override
  AddVehicleState cavetNumber(String? cavetNumber) =>
      this(cavetNumber: cavetNumber);

  @override
  AddVehicleState pageSize(int pageSize) => this(pageSize: pageSize);

  @override
  AddVehicleState pageKey(int pageKey) => this(pageKey: pageKey);

  @override
  AddVehicleState hasMoreData(bool hasMoreData) =>
      this(hasMoreData: hasMoreData);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddVehicleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddVehicleState(...).copyWith(id: 12, name: "My name")
  /// ````
  AddVehicleState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? dataChange = const $CopyWithPlaceholder(),
    Object? vehicles = const $CopyWithPlaceholder(),
    Object? selectedVehicle = const $CopyWithPlaceholder(),
    Object? licensePlate = const $CopyWithPlaceholder(),
    Object? cavetNumber = const $CopyWithPlaceholder(),
    Object? pageSize = const $CopyWithPlaceholder(),
    Object? pageKey = const $CopyWithPlaceholder(),
    Object? hasMoreData = const $CopyWithPlaceholder(),
  }) {
    return AddVehicleState(
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
          : vehicles as List<OptionItem>,
      selectedVehicle: selectedVehicle == const $CopyWithPlaceholder()
          ? _value.selectedVehicle
          // ignore: cast_nullable_to_non_nullable
          : selectedVehicle as OptionItem?,
      licensePlate: licensePlate == const $CopyWithPlaceholder()
          ? _value.licensePlate
          // ignore: cast_nullable_to_non_nullable
          : licensePlate as String?,
      cavetNumber: cavetNumber == const $CopyWithPlaceholder()
          ? _value.cavetNumber
          // ignore: cast_nullable_to_non_nullable
          : cavetNumber as String?,
      pageSize: pageSize == const $CopyWithPlaceholder() || pageSize == null
          ? _value.pageSize
          // ignore: cast_nullable_to_non_nullable
          : pageSize as int,
      pageKey: pageKey == const $CopyWithPlaceholder() || pageKey == null
          ? _value.pageKey
          // ignore: cast_nullable_to_non_nullable
          : pageKey as int,
      hasMoreData:
          hasMoreData == const $CopyWithPlaceholder() || hasMoreData == null
              ? _value.hasMoreData
              // ignore: cast_nullable_to_non_nullable
              : hasMoreData as bool,
    );
  }
}

extension $AddVehicleStateCopyWith on AddVehicleState {
  /// Returns a callable class that can be used as follows: `instanceOfAddVehicleState.copyWith(...)` or like so:`instanceOfAddVehicleState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddVehicleStateCWProxy get copyWith => _$AddVehicleStateCWProxyImpl(this);
}
