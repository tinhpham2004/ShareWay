// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'take_photo_id_card_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TakePhotoIdCardStateCWProxy {
  TakePhotoIdCardState isLoading(bool isLoading);

  TakePhotoIdCardState isCameraInitialized(bool isCameraInitialized);

  TakePhotoIdCardState cameraController(CameraController? cameraController);

  TakePhotoIdCardState cameras(List<CameraDescription>? cameras);

  TakePhotoIdCardState authData(AuthData? authData);

  TakePhotoIdCardState screen(TakePhotoIdCardEnum screen);

  TakePhotoIdCardState buttonTitle(ButtonTitleEnum buttonTitle);

  TakePhotoIdCardState frontSideImage(File? frontSideImage);

  TakePhotoIdCardState backSideImage(File? backSideImage);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TakePhotoIdCardState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TakePhotoIdCardState(...).copyWith(id: 12, name: "My name")
  /// ````
  TakePhotoIdCardState call({
    bool? isLoading,
    bool? isCameraInitialized,
    CameraController? cameraController,
    List<CameraDescription>? cameras,
    AuthData? authData,
    TakePhotoIdCardEnum? screen,
    ButtonTitleEnum? buttonTitle,
    File? frontSideImage,
    File? backSideImage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTakePhotoIdCardState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTakePhotoIdCardState.copyWith.fieldName(...)`
class _$TakePhotoIdCardStateCWProxyImpl
    implements _$TakePhotoIdCardStateCWProxy {
  const _$TakePhotoIdCardStateCWProxyImpl(this._value);

  final TakePhotoIdCardState _value;

  @override
  TakePhotoIdCardState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  TakePhotoIdCardState isCameraInitialized(bool isCameraInitialized) =>
      this(isCameraInitialized: isCameraInitialized);

  @override
  TakePhotoIdCardState cameraController(CameraController? cameraController) =>
      this(cameraController: cameraController);

  @override
  TakePhotoIdCardState cameras(List<CameraDescription>? cameras) =>
      this(cameras: cameras);

  @override
  TakePhotoIdCardState authData(AuthData? authData) => this(authData: authData);

  @override
  TakePhotoIdCardState screen(TakePhotoIdCardEnum screen) =>
      this(screen: screen);

  @override
  TakePhotoIdCardState buttonTitle(ButtonTitleEnum buttonTitle) =>
      this(buttonTitle: buttonTitle);

  @override
  TakePhotoIdCardState frontSideImage(File? frontSideImage) =>
      this(frontSideImage: frontSideImage);

  @override
  TakePhotoIdCardState backSideImage(File? backSideImage) =>
      this(backSideImage: backSideImage);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TakePhotoIdCardState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TakePhotoIdCardState(...).copyWith(id: 12, name: "My name")
  /// ````
  TakePhotoIdCardState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? isCameraInitialized = const $CopyWithPlaceholder(),
    Object? cameraController = const $CopyWithPlaceholder(),
    Object? cameras = const $CopyWithPlaceholder(),
    Object? authData = const $CopyWithPlaceholder(),
    Object? screen = const $CopyWithPlaceholder(),
    Object? buttonTitle = const $CopyWithPlaceholder(),
    Object? frontSideImage = const $CopyWithPlaceholder(),
    Object? backSideImage = const $CopyWithPlaceholder(),
  }) {
    return TakePhotoIdCardState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      isCameraInitialized:
          isCameraInitialized == const $CopyWithPlaceholder() ||
                  isCameraInitialized == null
              ? _value.isCameraInitialized
              // ignore: cast_nullable_to_non_nullable
              : isCameraInitialized as bool,
      cameraController: cameraController == const $CopyWithPlaceholder()
          ? _value.cameraController
          // ignore: cast_nullable_to_non_nullable
          : cameraController as CameraController?,
      cameras: cameras == const $CopyWithPlaceholder()
          ? _value.cameras
          // ignore: cast_nullable_to_non_nullable
          : cameras as List<CameraDescription>?,
      authData: authData == const $CopyWithPlaceholder()
          ? _value.authData
          // ignore: cast_nullable_to_non_nullable
          : authData as AuthData?,
      screen: screen == const $CopyWithPlaceholder() || screen == null
          ? _value.screen
          // ignore: cast_nullable_to_non_nullable
          : screen as TakePhotoIdCardEnum,
      buttonTitle:
          buttonTitle == const $CopyWithPlaceholder() || buttonTitle == null
              ? _value.buttonTitle
              // ignore: cast_nullable_to_non_nullable
              : buttonTitle as ButtonTitleEnum,
      frontSideImage: frontSideImage == const $CopyWithPlaceholder()
          ? _value.frontSideImage
          // ignore: cast_nullable_to_non_nullable
          : frontSideImage as File?,
      backSideImage: backSideImage == const $CopyWithPlaceholder()
          ? _value.backSideImage
          // ignore: cast_nullable_to_non_nullable
          : backSideImage as File?,
    );
  }
}

extension $TakePhotoIdCardStateCopyWith on TakePhotoIdCardState {
  /// Returns a callable class that can be used as follows: `instanceOfTakePhotoIdCardState.copyWith(...)` or like so:`instanceOfTakePhotoIdCardState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TakePhotoIdCardStateCWProxy get copyWith =>
      _$TakePhotoIdCardStateCWProxyImpl(this);
}
