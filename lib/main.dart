import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/domain/user/user_repository.dart';
import 'package:share_way_frontend/firebase_options.dart';
import 'package:share_way_frontend/my_app.dart';
import 'package:share_way_frontend/router/app_path.dart';
import 'package:share_way_frontend/router/app_router.dart';

Future<void> main() async {
  await initializeApp();
  GoRouter router = await initializeRouter();
  runApp(MyApp(router: router));
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<GoRouter> initializeRouter() async {
  GoRouter router = AppRouter().router;
  String initialRoute = AppPath.onboarding;
  dynamic data;

  final refreshToken = await Preferences.getRefreshToken();
  if (refreshToken != null) {
    final userRepository = UserRepository();
    final user = await userRepository.getProfile();
    if (user != null) {
      initialRoute = AppPath.home;
      data = user;
    }
  } else {
    final authData = await Preferences.getAuthData();
    if (authData != null) {
      initialRoute =
          authData.userId != null ? AppPath.verifyIdCard : AppPath.signUpName;
      data = authData;
    }
  }

  router.go(initialRoute, extra: data);

  return router;
}
