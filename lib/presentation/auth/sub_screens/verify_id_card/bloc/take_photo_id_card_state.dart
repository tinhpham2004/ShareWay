import 'dart:io';

import 'package:camera/camera.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/presentation/auth/models/auth_data.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/enums/button_title_enum.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/enums/take_photo_id_card_enum.dart';

part 'take_photo_id_card_state.g.dart';

@CopyWith()
class TakePhotoIdCardState {
  bool isLoading;
  final TakePhotoIdCardEnum screen;
  final AuthData? authData;
  final ButtonTitleEnum buttonTitle;
  final CameraController? cameraController;
  final List<CameraDescription>? cameras;
  final File? frontSideImage;
  final File? backSideImage;

  TakePhotoIdCardState({
    this.isLoading = false,
    this.cameraController,
    this.cameras,
    this.authData,
    this.screen = TakePhotoIdCardEnum.frontSide,
    this.buttonTitle = ButtonTitleEnum.confirm,
    this.frontSideImage,
    this.backSideImage,
  });
}
