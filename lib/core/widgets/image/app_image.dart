import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';

class AppAvatar extends StatelessWidget {
  final String avatarUrl;
  final BoxFit? fit;
  final double? height;
  final double? width;

  const AppAvatar({
    super.key,
    required this.avatarUrl,
    this.fit,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: avatarUrl,
      placeholder: (context, url) => const CircularProgressIndicator(
        color: AppColor.primaryColor,
        strokeWidth: 2.0,
      ),
      errorWidget: (context, url, error) => Assets.images.defaultAvatar.image(),
      fit: fit,
      height: height,
      width: width,
    );
  }
}
