import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';

class AppAvatar extends StatelessWidget {
  final String avatarUrl;
  final double? averageRating;
  final BoxFit? fit;
  final double? height;
  final double? width;

  const AppAvatar({
    super.key,
    required this.avatarUrl,
    this.averageRating,
    this.fit,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: avatarUrl,
          placeholder: (context, url) => const CircularProgressIndicator(
            color: AppColor.primaryColor,
            strokeWidth: 2.0,
          ),
          errorWidget: (context, url, error) =>
              Assets.images.defaultAvatar.image(),
          fit: fit,
          height: height,
          width: width,
        ),
        if (averageRating != null)
          Positioned(
            bottom: 0,
            right: 12.w,
            left: 12.w,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Flexible(
                child: Text(
                  averageRating!.toStringAsFixed(1),
                  style: textTheme.labelSmall!.copyWith(color: AppColor.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
