import 'package:flutter/material.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';

void showErrorSnackbar(BuildContext context, String errorMessage) {
  final snackBar = SnackBar(
    content: Text(
      errorMessage,
      style: const TextStyle(color: AppColor.white),
    ),
    backgroundColor: AppColor.error,
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    action: SnackBarAction(
      label: 'Ẩn',
      textColor: AppColor.white,
      onPressed: () {},
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSuccessSnackbar(BuildContext context, String successMessage) {
  final snackBar = SnackBar(
    content: Text(
      successMessage,
      style: const TextStyle(color: AppColor.white),
    ),
    backgroundColor: AppColor.success,
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    action: SnackBarAction(
      label: 'Ẩn',
      textColor: AppColor.white,
      onPressed: () {},
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

