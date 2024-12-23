import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';
import 'package:share_way_frontend/presentation/auth/models/auth_data.dart';
import 'package:share_way_frontend/router/app_path.dart';

class VerifyIdCardScreen extends StatefulWidget {
  final AuthData authData;
  const VerifyIdCardScreen({super.key, required this.authData});

  @override
  State<VerifyIdCardScreen> createState() => _VerifyIdCardScreenState();
}

class _VerifyIdCardScreenState extends State<VerifyIdCardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, top: 0.1.sh, right: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    spaceH8,
                    _buildSmallText(),
                    spaceH64,
                    Assets.images.verifyIdCardBackground.image(),
                  ],
                ),
              ),
            ),
            _buildStarButton(),
          ],
        ),
      ),
    );
  }

  Column _buildStarButton() {
    return Column(
      children: [
        Row(
          children: [
            AppButton(
              title: 'Bắt đầu',
              onPressed: () => GoRouter.of(context).push(
                AppPath.takePhotoIdCard,
                extra: widget.authData,
              ),
            ),
          ],
        ),
        spaceH12,
      ],
    );
  }

  Column _buildSmallText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Để tăng cường độ tin cậy cho ứng dụng, vui lòng xác thực giấy tờ tuỳ thân của bạn.',
          style: textTheme.labelLarge!.copyWith(
            color: AppColor.secondary300,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Giấy tờ tuỳ thân có thể là một trong các hình thức sau:',
          style: textTheme.labelLarge!.copyWith(
            color: AppColor.secondary300,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'CCCD/CMND/Chứng minh thư quân đội.',
          style: textTheme.labelLarge!.copyWith(
            color: AppColor.secondary300,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Text _buildHeader() {
    return Text(
      'Xác thực Giấy tờ',
      style: textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
