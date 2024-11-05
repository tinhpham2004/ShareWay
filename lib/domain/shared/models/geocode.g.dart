// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocode.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GeocodeCWProxy {
  Geocode latitude(double latitude);

  Geocode longitude(double longitude);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Geocode(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Geocode(...).copyWith(id: 12, name: "My name")
  /// ````
  Geocode call({
    double? latitude,
    double? longitude,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGeocode.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGeocode.copyWith.fieldName(...)`
class _$GeocodeCWProxyImpl implements _$GeocodeCWProxy {
  const _$GeocodeCWProxyImpl(this._value);

  final Geocode _value;

  @override
  Geocode latitude(double latitude) => this(latitude: latitude);

  @override
  Geocode longitude(double longitude) => this(longitude: longitude);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Geocode(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Geocode(...).copyWith(id: 12, name: "My name")
  /// ````
  Geocode call({
    Object? latitude = const $CopyWithPlaceholder(),
    Object? longitude = const $CopyWithPlaceholder(),
  }) {
    return Geocode(
      latitude: latitude == const $CopyWithPlaceholder() || latitude == null
          ? _value.latitude
          // ignore: cast_nullable_to_non_nullable
          : latitude as double,
      longitude: longitude == const $CopyWithPlaceholder() || longitude == null
          ? _value.longitude
          // ignore: cast_nullable_to_non_nullable
          : longitude as double,
    );
  }
}

extension $GeocodeCopyWith on Geocode {
  /// Returns a callable class that can be used as follows: `instanceOfGeocode.copyWith(...)` or like so:`instanceOfGeocode.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GeocodeCWProxy get copyWith => _$GeocodeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Geocode _$GeocodeFromJson(Map<String, dynamic> json) => Geocode(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$GeocodeToJson(Geocode instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
