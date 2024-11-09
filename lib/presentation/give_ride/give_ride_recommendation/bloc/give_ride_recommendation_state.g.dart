// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'give_ride_recommendation_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GiveRideRecommendationStateCWProxy {
  GiveRideRecommendationState isLoading(bool isLoading);

  GiveRideRecommendationState dataChange(bool dataChange);

  GiveRideRecommendationState hitchRideRecommendationList(
      List<HitchRideRecommendationOuput> hitchRideRecommendationList);

  GiveRideRecommendationState createGiveRideOutput(
      CreateGiveRideOutput? createGiveRideOutput);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GiveRideRecommendationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GiveRideRecommendationState(...).copyWith(id: 12, name: "My name")
  /// ````
  GiveRideRecommendationState call({
    bool? isLoading,
    bool? dataChange,
    List<HitchRideRecommendationOuput>? hitchRideRecommendationList,
    CreateGiveRideOutput? createGiveRideOutput,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGiveRideRecommendationState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGiveRideRecommendationState.copyWith.fieldName(...)`
class _$GiveRideRecommendationStateCWProxyImpl
    implements _$GiveRideRecommendationStateCWProxy {
  const _$GiveRideRecommendationStateCWProxyImpl(this._value);

  final GiveRideRecommendationState _value;

  @override
  GiveRideRecommendationState isLoading(bool isLoading) =>
      this(isLoading: isLoading);

  @override
  GiveRideRecommendationState dataChange(bool dataChange) =>
      this(dataChange: dataChange);

  @override
  GiveRideRecommendationState hitchRideRecommendationList(
          List<HitchRideRecommendationOuput> hitchRideRecommendationList) =>
      this(hitchRideRecommendationList: hitchRideRecommendationList);

  @override
  GiveRideRecommendationState createGiveRideOutput(
          CreateGiveRideOutput? createGiveRideOutput) =>
      this(createGiveRideOutput: createGiveRideOutput);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GiveRideRecommendationState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GiveRideRecommendationState(...).copyWith(id: 12, name: "My name")
  /// ````
  GiveRideRecommendationState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? dataChange = const $CopyWithPlaceholder(),
    Object? hitchRideRecommendationList = const $CopyWithPlaceholder(),
    Object? createGiveRideOutput = const $CopyWithPlaceholder(),
  }) {
    return GiveRideRecommendationState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      dataChange:
          dataChange == const $CopyWithPlaceholder() || dataChange == null
              ? _value.dataChange
              // ignore: cast_nullable_to_non_nullable
              : dataChange as bool,
      hitchRideRecommendationList: hitchRideRecommendationList ==
                  const $CopyWithPlaceholder() ||
              hitchRideRecommendationList == null
          ? _value.hitchRideRecommendationList
          // ignore: cast_nullable_to_non_nullable
          : hitchRideRecommendationList as List<HitchRideRecommendationOuput>,
      createGiveRideOutput: createGiveRideOutput == const $CopyWithPlaceholder()
          ? _value.createGiveRideOutput
          // ignore: cast_nullable_to_non_nullable
          : createGiveRideOutput as CreateGiveRideOutput?,
    );
  }
}

extension $GiveRideRecommendationStateCopyWith on GiveRideRecommendationState {
  /// Returns a callable class that can be used as follows: `instanceOfGiveRideRecommendationState.copyWith(...)` or like so:`instanceOfGiveRideRecommendationState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GiveRideRecommendationStateCWProxy get copyWith =>
      _$GiveRideRecommendationStateCWProxyImpl(this);
}
