import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/firebase_options.dart';
import 'package:share_way_frontend/router/app_router.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          builder: (context, widget) {
            ScreenUtil.init(context);
            return SafeArea(child: widget!);
          },
          routerConfig: AppRouter().router,
        );
      },
    );
  }
}
