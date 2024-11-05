// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_vehicle_ouput.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetVehicleOuputCWProxy {
  GetVehicleOuput vehicleId(String? vehicleId);

  GetVehicleOuput name(String? name);

  GetVehicleOuput fuelConsumed(double? fuelConsumed);

  GetVehicleOuput licensePlate(String? licensePlate);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetVehicleOuput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetVehicleOuput(...).copyWith(id: 12, name: "My name")
  /// ````
  GetVehicleOuput call({
    String? vehicleId,
    String? name,
    double? fuelConsumed,
    String? licensePlate,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetVehicleOuput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetVehicleOuput.copyWith.fieldName(...)`
class _$GetVehicleOuputCWProxyImpl implements _$GetVehicleOuputCWProxy {
  const _$GetVehicleOuputCWProxyImpl(this._value);

  final GetVehicleOuput _value;

  @override
  GetVehicleOuput vehicleId(String? vehicleId) => this(vehicleId: vehicleId);

  @override
  GetVehicleOuput name(String? name) => this(name: name);

  @override
  GetVehicleOuput fuelConsumed(double? fuelConsumed) =>
      this(fuelConsumed: fuelConsumed);

  @override
  GetVehicleOuput licensePlate(String? licensePlate) =>
      this(licensePlate: licensePlate);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetVehicleOuput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetVehicleOuput(...).copyWith(id: 12, name: "My name")
  /// ````
  GetVehicleOuput call({
    Object? vehicleId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? fuelConsumed = const $CopyWithPlaceholder(),
    Object? licensePlate = const $CopyWithPlaceholder(),
  }) {
    return GetVehicleOuput(
      vehicleId: vehicleId == const $CopyWithPlaceholder()
          ? _value.vehicleId
          // ignore: cast_nullable_to_non_nullable
          : vehicleId as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      fuelConsumed: fuelConsumed == const $CopyWithPlaceholder()
          ? _value.fuelConsumed
          // ignore: cast_nullable_to_non_nullable
          : fuelConsumed as double?,
      licensePlate: licensePlate == const $CopyWithPlaceholder()
          ? _value.licensePlate
          // ignore: cast_nullable_to_non_nullable
          : licensePlate as String?,
    );
  }
}

extension $GetVehicleOuputCopyWith on GetVehicleOuput {
  /// Returns a callable class that can be used as follows: `instanceOfGetVehicleOuput.copyWith(...)` or like so:`instanceOfGetVehicleOuput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetVehicleOuputCWProxy get copyWith => _$GetVehicleOuputCWProxyImpl(this);
}
