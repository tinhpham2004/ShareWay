import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/presentation/auth/sub_screens/verify_id_card/bloc/verify_id_card_state.dart';

class VerifyIdCardBloc extends Cubit<VerifyIdCardState> {
  VerifyIdCardBloc() : super(VerifyIdCardState());

  void onStart({required BuildContext context}) async {
    emit(
      state.copyWith(isLoading: true),
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
        CameraController(cameras[0], ResolutionPreset.high);
    emit(state.copyWith(cameraController: cameraController));

    await state.cameraController!.initialize();
  }
}
