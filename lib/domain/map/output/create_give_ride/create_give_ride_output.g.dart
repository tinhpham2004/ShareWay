// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_give_ride_output.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateGiveRideOutputCWProxy {
  CreateGiveRideOutput giveRideId(String? giveRideId);

  CreateGiveRideOutput locationList(
      List<CreateGiveRideLocationOutput?> locationList);

  CreateGiveRideOutput polyline(String? polyline);

  CreateGiveRideOutput distance(int? distance);

  CreateGiveRideOutput duration(int? duration);

  CreateGiveRideOutput fare(int? fare);

  CreateGiveRideOutput vehicle(String? vehicle);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateGiveRideOutput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateGiveRideOutput(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateGiveRideOutput call({
    String? giveRideId,
    List<CreateGiveRideLocationOutput?>? locationList,
    String? polyline,
    int? distance,
    int? duration,
    int? fare,
    String? vehicle,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateGiveRideOutput.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreateGiveRideOutput.copyWith.fieldName(...)`
class _$CreateGiveRideOutputCWProxyImpl
    implements _$CreateGiveRideOutputCWProxy {
  const _$CreateGiveRideOutputCWProxyImpl(this._value);

  final CreateGiveRideOutput _value;

  @override
  CreateGiveRideOutput giveRideId(String? giveRideId) =>
      this(giveRideId: giveRideId);

  @override
  CreateGiveRideOutput locationList(
          List<CreateGiveRideLocationOutput?> locationList) =>
      this(locationList: locationList);

  @override
  CreateGiveRideOutput polyline(String? polyline) => this(polyline: polyline);

  @override
  CreateGiveRideOutput distance(int? distance) => this(distance: distance);

  @override
  CreateGiveRideOutput duration(int? duration) => this(duration: duration);

  @override
  CreateGiveRideOutput fare(int? fare) => this(fare: fare);

  @override
  CreateGiveRideOutput vehicle(String? vehicle) => this(vehicle: vehicle);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateGiveRideOutput(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateGiveRideOutput(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateGiveRideOutput call({
    Object? giveRideId = const $CopyWithPlaceholder(),
    Object? locationList = const $CopyWithPlaceholder(),
    Object? polyline = const $CopyWithPlaceholder(),
    Object? distance = const $CopyWithPlaceholder(),
    Object? duration = const $CopyWithPlaceholder(),
    Object? fare = const $CopyWithPlaceholder(),
    Object? vehicle = const $CopyWithPlaceholder(),
  }) {
    return CreateGiveRideOutput(
      giveRideId: giveRideId == const $CopyWithPlaceholder()
          ? _value.giveRideId
          // ignore: cast_nullable_to_non_nullable
          : giveRideId as String?,
      locationList:
          locationList == const $CopyWithPlaceholder() || locationList == null
              ? _value.locationList
              // ignore: cast_nullable_to_non_nullable
              : locationList as List<CreateGiveRideLocationOutput?>,
      polyline: polyline == const $CopyWithPlaceholder()
          ? _value.polyline
          // ignore: cast_nullable_to_non_nullable
          : polyline as String?,
      distance: distance == const $CopyWithPlaceholder()
          ? _value.distance
          // ignore: cast_nullable_to_non_nullable
          : distance as int?,
      duration: duration == const $CopyWithPlaceholder()
          ? _value.duration
          // ignore: cast_nullable_to_non_nullable
          : duration as int?,
      fare: fare == const $CopyWithPlaceholder()
          ? _value.fare
          // ignore: cast_nullable_to_non_nullable
          : fare as int?,
      vehicle: vehicle == const $CopyWithPlaceholder()
          ? _value.vehicle
          // ignore: cast_nullable_to_non_nullable
          : vehicle as String?,
    );
  }
}

extension $CreateGiveRideOutputCopyWith on CreateGiveRideOutput {
  /// Returns a callable class that can be used as follows: `instanceOfCreateGiveRideOutput.copyWith(...)` or like so:`instanceOfCreateGiveRideOutput.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CreateGiveRideOutputCWProxy get copyWith =>
      _$CreateGiveRideOutputCWProxyImpl(this);
}
