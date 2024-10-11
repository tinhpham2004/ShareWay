import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HoleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    Rect holeRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: 300.w,
      height: 180.h,
    );

    RRect roundedHoleRect = RRect.fromRectAndRadius(
      holeRect,
      Radius.circular(10.r),
    );

    path.addRRect(roundedHoleRect);
    return path..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
