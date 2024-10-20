import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';

class PacmanLoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: LoadingIndicator(
                indicatorType: Indicator.pacman,
                colors: [
                  AppColor.primaryColor,
                  AppColor.primary100,
                ],
                strokeWidth: 2,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Xin chờ...',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

void showPacmanLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return PacmanLoadingDialog();
    },
  );
}

void hidePacmanLoadingDialog(BuildContext context) {
  Navigator.of(context).pop();
}
