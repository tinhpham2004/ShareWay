// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_id_card_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VerifyIdCardStateCWProxy {
  VerifyIdCardState isLoading(bool isLoading);

  VerifyIdCardState cameraController(CameraController? cameraController);

  VerifyIdCardState cameras(List<CameraDescription>? cameras);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VerifyIdCardState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VerifyIdCardState(...).copyWith(id: 12, name: "My name")
  /// ````
  VerifyIdCardState call({
    bool? isLoading,
    CameraController? cameraController,
    List<CameraDescription>? cameras,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVerifyIdCardState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVerifyIdCardState.copyWith.fieldName(...)`
class _$VerifyIdCardStateCWProxyImpl implements _$VerifyIdCardStateCWProxy {
  const _$VerifyIdCardStateCWProxyImpl(this._value);

  final VerifyIdCardState _value;

  @override
  VerifyIdCardState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  VerifyIdCardState cameraController(CameraController? cameraController) =>
      this(cameraController: cameraController);

  @override
  VerifyIdCardState cameras(List<CameraDescription>? cameras) =>
      this(cameras: cameras);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VerifyIdCardState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VerifyIdCardState(...).copyWith(id: 12, name: "My name")
  /// ````
  VerifyIdCardState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? cameraController = const $CopyWithPlaceholder(),
    Object? cameras = const $CopyWithPlaceholder(),
  }) {
    return VerifyIdCardState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      cameraController: cameraController == const $CopyWithPlaceholder()
          ? _value.cameraController
          // ignore: cast_nullable_to_non_nullable
          : cameraController as CameraController?,
      cameras: cameras == const $CopyWithPlaceholder()
          ? _value.cameras
          // ignore: cast_nullable_to_non_nullable
          : cameras as List<CameraDescription>?,
    );
  }
}

extension $VerifyIdCardStateCopyWith on VerifyIdCardState {
  /// Returns a callable class that can be used as follows: `instanceOfVerifyIdCardState.copyWith(...)` or like so:`instanceOfVerifyIdCardState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VerifyIdCardStateCWProxy get copyWith =>
      _$VerifyIdCardStateCWProxyImpl(this);
}
