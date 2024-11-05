import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';

class DashedBorder extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColor.primaryColor
      ..strokeWidth = 1.w
      ..style = PaintingStyle.stroke;

    final dashWidth = 5.w;
    final dashSpace = 3.w;
    final rect = RRect.fromLTRBR(
      0,
      0,
      size.width,
      size.height,
      Radius.circular(8.r),
    );

    _drawDashedRect(canvas, rect, paint, dashWidth, dashSpace);
  }

  void _drawDashedRect(Canvas canvas, RRect rect, Paint paint, double dashWidth,
      double dashSpace) {
    final path = Path()..addRRect(rect);
    final dashPath = Path();
    for (PathMetric pathMetric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final segment = pathMetric.extractPath(distance, distance + dashWidth);
        dashPath.addPath(segment, Offset.zero);
        distance += dashWidth + dashSpace;
      }
    }
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
