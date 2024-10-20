import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image/image.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/auth/auth_repository.dart';
import 'package:share_way_frontend/domain/auth/input/verify_id_card_input.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/presentation/auth/models/auth_data.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/bloc/take_photo_id_card_state.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/enums/button_title_enum.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/enums/take_photo_id_card_enum.dart';
import 'package:image/image.dart' as img;
import 'package:share_way_frontend/router/app_path.dart';

class TakePhotoIdCardBloc extends Cubit<TakePhotoIdCardState> {
  TakePhotoIdCardBloc() : super(TakePhotoIdCardState());

  final _authRepository = AuthRepository();

  void onStart(AuthData authData) async {
    emit(
      state.copyWith(
        isLoading: true,
        authData: authData,
      ),
    );
    try {
      await initializeCamera();
    } catch (e) {
      // TODO: Handle error
    } finally {
      emit(
        state.copyWith(isLoading: false),
      );
    }
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final cameraController =
        CameraController(cameras.first, ResolutionPreset.high);
    emit(state.copyWith(cameraController: cameraController));

    await state.cameraController!.initialize();
  }

  Future<void> pauseCamera() async {
    await state.cameraController!.pausePreview();
  }

  Future<void> resumeCamera() async {
    await state.cameraController!.resumePreview();
  }

  Future<void> onRetakeButtonPressed(BuildContext context) async {
    await resumeCamera();
    emit(state.copyWith(buttonTitle: ButtonTitleEnum.confirm));
  }

  Future<void> takePhoto() async {
    final image = await state.cameraController!.takePicture();
    Uint8List imageBytes = await image.readAsBytes();
    img.Image? decodedImage = img.decodeImage(imageBytes);

    if (decodedImage != null) {
      final croppedImageFile = await _processAndCropImage(decodedImage);
      _emitCroppedImage(croppedImageFile);
    }
  }

  Future<File> _processAndCropImage(img.Image decodedImage) async {
    int holeWidth = 300.w.toInt();
    int holeHeight = 180.h.toInt();
    double scaleFactor = 1.9;

    int newWidth = (decodedImage.width / scaleFactor).floor();
    int newHeight = (decodedImage.height / scaleFactor).floor();

    img.Image scaledImage = img.copyResize(
      decodedImage,
      width: newWidth,
      height: newHeight,
    );

    int centerX = scaledImage.width ~/ 2;
    int centerY = scaledImage.height ~/ 2;

    int cropX = centerX - (holeWidth ~/ 2);
    int cropY = centerY - (holeHeight ~/ 2);

    cropX = cropX.clamp(0, scaledImage.width - holeWidth);
    cropY = cropY.clamp(0, scaledImage.height - holeHeight);

    img.Image croppedImage = img.copyCrop(
      scaledImage,
      x: cropX,
      y: cropY,
      width: holeWidth,
      height: holeHeight,
    );

    List<int> croppedImageBytes = img.encodePng(
      croppedImage,
      level: 0,
      filter: PngFilter.none,
    );

    return File('${Directory.systemTemp.path}/${DateTime.now()}.png')
      ..writeAsBytesSync(croppedImageBytes);
  }

  void _emitCroppedImage(File croppedImageFile) {
    switch (state.screen) {
      case TakePhotoIdCardEnum.frontSide:
        emit(state.copyWith(frontSideImage: croppedImageFile));
        break;
      case TakePhotoIdCardEnum.backSide:
        emit(state.copyWith(backSideImage: croppedImageFile));
        break;
    }
  }

  void onBack(BuildContext context) {
    switch (state.screen) {
      case TakePhotoIdCardEnum.frontSide:
        GoRouter.of(context).pop();
        break;
      case TakePhotoIdCardEnum.backSide:
        emit(state.copyWith(
          screen: TakePhotoIdCardEnum.frontSide,
          buttonTitle: ButtonTitleEnum.confirm,
        ));
        break;
    }
  }

  Future<void> onConfirmButtonPressed(BuildContext context) async {
    if (state.screen == TakePhotoIdCardEnum.frontSide) {
      await _handleFrontSideConfirmation();
    } else if (state.screen == TakePhotoIdCardEnum.backSide) {
      await _handleBackSideConfirmation(context);
    }
  }

  Future<void> _handleFrontSideConfirmation() async {
    if (state.buttonTitle == ButtonTitleEnum.confirm) {
      await takePhoto();
      await pauseCamera();
      emit(state.copyWith(buttonTitle: ButtonTitleEnum.resume));
    } else if (state.buttonTitle == ButtonTitleEnum.resume) {
      await resumeCamera();
      emit(state.copyWith(
        buttonTitle: ButtonTitleEnum.confirm,
        screen: TakePhotoIdCardEnum.backSide,
      ));
    }
  }

  Future<void> _handleBackSideConfirmation(BuildContext context) async {
    if (state.buttonTitle == ButtonTitleEnum.confirm) {
      await takePhoto();
      await pauseCamera();
      emit(state.copyWith(buttonTitle: ButtonTitleEnum.resume));
    } else if (state.buttonTitle == ButtonTitleEnum.resume) {
      // await resumeCamera();
      final input = VerifyIdCardInput(
        frontSideImage: state.frontSideImage!,
        backSideImage: state.backSideImage!,
        phoneNumber: state.authData!.phoneNumber,
        userId: state.authData!.userId!,
      );
      final response = await _authRepository.verifyIdCard(input);
      if (response != null) {
        await Preferences.saveToken(
          accessToken: response.accessToken!,
          refreshToken: response.refreshToken!,
        );
        await Preferences.clearAuthData();
        GoRouter.of(context).go(AppPath.home, extra: response.appUser);
      } else {
        showErrorSnackbar(context, 'Đã có lỗi xảy ra');
      }
    }
  }
}
