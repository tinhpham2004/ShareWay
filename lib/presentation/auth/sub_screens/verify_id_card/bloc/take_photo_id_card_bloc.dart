import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/bloc/take_photo_id_card_state.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/enums/button_title_enum.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/enums/take_photo_id_card_enum.dart';
import 'package:image/image.dart' as img;
import 'package:share_way_frontend/router/app_path.dart';

class TakePhotoIdCardBloc extends Cubit<TakePhotoIdCardState> {
  TakePhotoIdCardBloc() : super(TakePhotoIdCardState());

  void onStart({required BuildContext context}) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    try {
      await initializeCamera();
    } catch (e) {
      showErrorSnackbar(context, e.toString());
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

  Future<void> takePhoto() async {
    final image = await state.cameraController!.takePicture();

    Uint8List imageBytes = await image.readAsBytes();
    img.Image? decodedImage = img.decodeImage(imageBytes);

    if (decodedImage != null) {
      // Define the hole's dimensions
      int holeWidth = 300.w.toInt();
      int holeHeight = 180.h.toInt();

      // Define a zoom-out scale factor (e.g., 2.0 for 200% zoom out)
      double scaleFactor = 1.9;

      // Calculate new dimensions for zoomed-out image
      int newWidth = (decodedImage.width / scaleFactor).floor();
      int newHeight = (decodedImage.height / scaleFactor).floor();

      // Create a new scaled image
      img.Image scaledImage =
          img.copyResize(decodedImage, width: newWidth, height: newHeight);

      // Calculate the center of the scaled image
      int centerX = scaledImage.width ~/ 2;
      int centerY = scaledImage.height ~/ 2;

      // Calculate crop coordinates
      int cropX = centerX - (holeWidth ~/ 2);
      int cropY = centerY - (holeHeight ~/ 2);

      // Ensure crop coordinates are within bounds
      cropX = cropX.clamp(0, scaledImage.width - holeWidth);
      cropY = cropY.clamp(0, scaledImage.height - holeHeight);

      // Crop the image
      img.Image croppedImage = img.copyCrop(scaledImage,
          x: cropX, y: cropY, width: holeWidth, height: holeHeight);
      List<int> croppedImageBytes = img.encodeJpg(croppedImage);

      // Save the cropped image
      File croppedImageFile =
          File('${Directory.systemTemp.path}/${DateTime.now()}.png')
            ..writeAsBytesSync(croppedImageBytes);

      // Emit the cropped image based on the screen context
      switch (state.screen) {
        case TakePhotoIdCardEnum.frontSide:
          emit(state.copyWith(frontSideImage: croppedImageFile));
          break;
        case TakePhotoIdCardEnum.backSide:
          emit(state.copyWith(backSideImage: croppedImageFile));
          break;
      }
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
    switch (state.screen) {
      case TakePhotoIdCardEnum.frontSide:
        switch (state.buttonTitle) {
          case ButtonTitleEnum.confirm:
            await takePhoto();
            await pauseCamera();
            emit(state.copyWith(buttonTitle: ButtonTitleEnum.resume));
            break;
          case ButtonTitleEnum.resume:
            await resumeCamera();
            emit(state.copyWith(
              buttonTitle: ButtonTitleEnum.confirm,
              screen: TakePhotoIdCardEnum.backSide,
            ));
            break;
        }
        break;
      case TakePhotoIdCardEnum.backSide:
        switch (state.buttonTitle) {
          case ButtonTitleEnum.confirm:
            await takePhoto();
            await pauseCamera();
            emit(state.copyWith(buttonTitle: ButtonTitleEnum.resume));
            break;
          case ButtonTitleEnum.resume:
            await resumeCamera();
            GoRouter.of(context).go(AppPath.home);
            break;
        }
        break;
    }
  }

  void onRetakeButtonPressed(BuildContext context) async {
    await resumeCamera();
    emit(state.copyWith(buttonTitle: ButtonTitleEnum.confirm));
  }
}
