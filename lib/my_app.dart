import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Share Way',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: AppColor.primaryColor,
              selectionColor: AppColor.primaryColor,
              selectionHandleColor: AppColor.primaryColor,
            ),
          ),
          routerConfig: router,
          builder: (context, widget) {
            ScreenUtil.init(context);
            return SafeArea(child: widget!);
          },
        );
      },
    );
  }
}
