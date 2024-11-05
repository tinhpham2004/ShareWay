// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_give_ride_location_output.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateGiveRideLocationOutputCWProxy {
  CreateGiveRideLocationOutput mainAddress(String? mainAddress);

  CreateGiveRideLocationOutput secondaryAddress(String? secondaryAddress);

  CreateGiveRideLocationOutput location(Geocode? location);

  CreateGiveRideLocationOutput distance(String? distance);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateGiveRideLocationOutput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateGiveRideLocationOutput(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateGiveRideLocationOutput call({
    String? mainAddress,
    String? secondaryAddress,
    Geocode? location,
    String? distance,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateGiveRideLocationOutput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreateGiveRideLocationOutput.copyWith.fieldName(...)`
class _$CreateGiveRideLocationOutputCWProxyImpl
    implements _$CreateGiveRideLocationOutputCWProxy {
  const _$CreateGiveRideLocationOutputCWProxyImpl(this._value);

  final CreateGiveRideLocationOutput _value;

  @override
  CreateGiveRideLocationOutput mainAddress(String? mainAddress) =>
      this(mainAddress: mainAddress);

  @override
  CreateGiveRideLocationOutput secondaryAddress(String? secondaryAddress) =>
      this(secondaryAddress: secondaryAddress);

  @override
  CreateGiveRideLocationOutput location(Geocode? location) =>
      this(location: location);

  @override
  CreateGiveRideLocationOutput distance(String? distance) =>
      this(distance: distance);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateGiveRideLocationOutput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateGiveRideLocationOutput(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateGiveRideLocationOutput call({
    Object? mainAddress = const $CopyWithPlaceholder(),
    Object? secondaryAddress = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? distance = const $CopyWithPlaceholder(),
  }) {
    return CreateGiveRideLocationOutput(
      mainAddress: mainAddress == const $CopyWithPlaceholder()
          ? _value.mainAddress
          // ignore: cast_nullable_to_non_nullable
          : mainAddress as String?,
      secondaryAddress: secondaryAddress == const $CopyWithPlaceholder()
          ? _value.secondaryAddress
          // ignore: cast_nullable_to_non_nullable
          : secondaryAddress as String?,
      location: location == const $CopyWithPlaceholder()
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as Geocode?,
      distance: distance == const $CopyWithPlaceholder()
          ? _value.distance
          // ignore: cast_nullable_to_non_nullable
          : distance as String?,
    );
  }
}

extension $CreateGiveRideLocationOutputCopyWith
    on CreateGiveRideLocationOutput {
  /// Returns a callable class that can be used as follows: `instanceOfCreateGiveRideLocationOutput.copyWith(...)` or like so:`instanceOfCreateGiveRideLocationOutput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateGiveRideLocationOutputCWProxy get copyWith =>
      _$CreateGiveRideLocationOutputCWProxyImpl(this);
}
