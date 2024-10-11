import 'package:camera/camera.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'verify_id_card_state.g.dart';

@CopyWith()
class VerifyIdCardState {
  bool isLoading;
  final CameraController? cameraController;
  final List<CameraDescription>? cameras;

  VerifyIdCardState({
    this.isLoading = false,
    this.cameraController,
    this.cameras,
  });
}
