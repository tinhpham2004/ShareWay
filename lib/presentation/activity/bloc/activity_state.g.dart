// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ActivityStateCWProxy {
  ActivityState isLoading(bool isLoading);

  ActivityState dataChange(bool dataChange);

  ActivityState rideList(List<HistoryRideOutput> rideList);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActivityState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActivityState(...).copyWith(id: 12, name: "My name")
  /// ````
  ActivityState call({
    bool? isLoading,
    bool? dataChange,
    List<HistoryRideOutput>? rideList,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfActivityState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfActivityState.copyWith.fieldName(...)`
class _$ActivityStateCWProxyImpl implements _$ActivityStateCWProxy {
  const _$ActivityStateCWProxyImpl(this._value);

  final ActivityState _value;

  @override
  ActivityState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  ActivityState dataChange(bool dataChange) => this(dataChange: dataChange);

  @override
  ActivityState rideList(List<HistoryRideOutput> rideList) =>
      this(rideList: rideList);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ActivityState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ActivityState(...).copyWith(id: 12, name: "My name")
  /// ````
  ActivityState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? dataChange = const $CopyWithPlaceholder(),
    Object? rideList = const $CopyWithPlaceholder(),
  }) {
    return ActivityState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      dataChange:
          dataChange == const $CopyWithPlaceholder() || dataChange == null
              ? _value.dataChange
              // ignore: cast_nullable_to_non_nullable
              : dataChange as bool,
      rideList: rideList == const $CopyWithPlaceholder() || rideList == null
          ? _value.rideList
          // ignore: cast_nullable_to_non_nullable
          : rideList as List<HistoryRideOutput>,
    );
  }
}

extension $ActivityStateCopyWith on ActivityState {
  /// Returns a callable class that can be used as follows: `instanceOfActivityState.copyWith(...)` or like so:`instanceOfActivityState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ActivityStateCWProxy get copyWith => _$ActivityStateCWProxyImpl(this);
}
