import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/domain/user/user_repository.dart';
import 'package:share_way_frontend/presentation/account/bloc/account_state.dart';
import 'package:share_way_frontend/presentation/account/models/setting.dart';
import 'package:share_way_frontend/router/app_path.dart';
import 'dart:ui' as ui;

class AccountBloc extends Cubit<AccountState> {
  AccountBloc() : super(AccountState());

  final _userRepository = UserRepository();

  void onStart(BuildContext context) {
    try {
      onFetchUser(context);
      onFetchAssets(context);
      final settings = [
        Setting(
          icon: AppIcon.settingUser,
          title: 'Chỉnh sửa thông tin',
          navigatePath: AppPath.editInformation,
        ),
        // Setting(
        //   icon: AppIcon.location_outlined,
        //   title: 'Địa chỉ đã lưu',
        // ),
        Setting(
          icon: AppIcon.wallet,
          title: 'Phương thức thanh toán',
          navigatePath: AppPath.setUpPaymentMethod,
        ),
        Setting(
          icon: AppIcon.settingVehicle,
          title: 'Quản lý phương tiện',
          navigatePath: AppPath.manageVehicle,
        ),
        // Setting(
        //   icon: AppIcon.settingIdCard,
        //   title: 'Xác thực giấy tờ tùy thân',
        // ),
        // Setting(
        //   icon: AppIcon.settingLink,
        //   title: 'Liên kết tài khoản',
        // ),
        Setting(
          icon: AppIcon.settingLogout,
          title: 'Đăng xuất',
          titleColor: AppColor.error,
        ),
      ];
      emit(state.copyWith(settings: settings));
    } catch (e) {
      // TODO: Add Home logic
    }
  }

  void onFetchUser(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _userRepository.getProfile();
      emit(state.copyWith(user: response));
    } catch (e) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onSettingSelect(BuildContext context, int index) async {
    final setting = state.settings[index];
    if (setting.navigatePath != null) {
      GoRouter.of(context).push(setting.navigatePath!);
    } else {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          title: Text(
            'Đăng xuất',
            style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
          ),
          content: Text(
            'Bạn thực sự muốn đăng xuất?',
            style: textTheme.bodyMedium,
          ),
          actions: [
            Row(
              children: [
                AppButton(
                  onPressed: () => GoRouter.of(context).pop(),
                  title: 'Hủy',
                  backgroundColor: AppColor.secondary200,
                  textColor: AppColor.primaryText,
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                    vertical: 8.h,
                  ),
                ),
                spaceW8,
                AppButton(
                  onPressed: () async {
                    await Preferences.clearAll();
                    GoRouter.of(context).go(AppPath.onboarding);
                  },
                  title: 'Đăng xuất',
                  backgroundColor: AppColor.primaryColor,
                  textColor: AppColor.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                    vertical: 8.h,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }
  }

  void onSelectImage(File? image) async {
    emit(state.copyWith(selectedImage: image));
  }

  void onFetchAssets(BuildContext context) async {
    final permission = await PhotoManager.requestPermissionExtend();
    if (permission.isAuth) {
      final albums =
          await PhotoManager.getAssetPathList(type: RequestType.image);
      if (albums.isNotEmpty) {
        final recentAlbum = albums.first;
        final assetListRange =
            await recentAlbum.getAssetListRange(start: 0, end: 100);

        // Fetch files concurrently
        final futures = assetListRange.map((asset) => asset.file);
        final files = await Future.wait(futures);

        final assets = files.whereType<File>().toList();
        emit(state.copyWith(assets: assets));
      }
    }
    // else{
    //   showErrorSnackbar(context, permission.name);
    // }
  }

  void onUpdateAvatar(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    final response = await _userRepository.updateAvatar(state.selectedImage!);
    if (response == null) {
      emit(state.copyWith(isLoading: false));
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
      return;
    }
    emit(state.copyWith(isLoading: false, user: response));
    showSuccessSnackbar(context, 'Cập nhật ảnh đại diện thành công');
  }

  void onCropImage(BuildContext context) async {
    if (state.selectedImage == null) return;

    final image = await ImageCropper().cropImage(
      sourcePath: state.selectedImage!.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: AppColor.primaryColor,
          statusBarColor: AppColor.primaryColor,
          activeControlsWidgetColor: AppColor.primaryColor,
          backgroundColor: AppColor.white,
          toolbarWidgetColor: AppColor.white,
          cropStyle: CropStyle.circle,
          initAspectRatio: CropAspectRatioPreset.square,
          aspectRatioPresets: [CropAspectRatioPreset.square],
        ),
        // IOSUiSettings(
        //   title: 'Cropper',
        //   aspectRatioPresets: [
        //     CropAspectRatioPreset.original,
        //     CropAspectRatioPreset.square,
        //     CropAspectRatioPresetCustom(), // IMPORTANT: iOS supports only one custom aspect ratio in preset list
        //   ],
        // ),
      ],
      compressQuality: 100,
      maxHeight: 100,
      maxWidth: 100,
    );
    if (image != null) {
      final input = await _convertToCircleImage(File(image.path));
      final response = await _userRepository.updateAvatar(input);
      if (response == null) showErrorSnackbar(context, 'Đã có lỗi xảy ra');
      emit(state.copyWith(user: response));
    }
  }

  Future<File> _convertToCircleImage(File imageFile) async {
    final originalImage = File(imageFile.path);
    final imageData = await originalImage.readAsBytes();
    final codec = await ui.instantiateImageCodec(imageData);
    final frameInfo = await codec.getNextFrame();
    final image = frameInfo.image;

    final size = ui.Size(image.width.toDouble(), image.height.toDouble());
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final paint = Paint();
    paint.isAntiAlias = true;

    // Draw a circular clipping path
    final path = Path()
      ..addOval(Rect.fromLTWH(0, 0, size.width, size.height))
      ..close();

    canvas.clipPath(path);
    canvas.drawImage(image, Offset.zero, paint);

    // Get the final image
    final picture = recorder.endRecording();
    final finalImage = await picture.toImage(image.width, image.height);

    // Convert to PNG and save
    final byteData =
        await finalImage.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();

    final directory = await getTemporaryDirectory();
    final circularImage = File('${directory.path}/circular_image.png');
    await circularImage.writeAsBytes(pngBytes);

    return circularImage;
  }
}
