import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:share_way_frontend/domain/fcm/fcm_repository.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/domain/shared/models/geocode.dart';
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
  final userRepository = UserRepository();
    final deviceToken = await FCMRepository.getDeviceToken();
    if (deviceToken != null) {
      final response = await userRepository.registerDeviceToken(deviceToken);
      if (response) {
        print('Device token registered with token: $deviceToken');
      }
    }

  MapboxOptions.setAccessToken(
      'pk.eyJ1IjoiY3JhenlhZHM2OSIsImEiOiJjbTJvYjhmeWYwZWpiMmtva3dwOXowN2ZsIn0.fTz4hYCsaWCxF2izZtahEQ');
  await onUpdateCurrentLocation();
}

Future<GoRouter> initializeRouter() async {
  GoRouter router = AppRouter().router;
  String initialRoute = AppPath.giveRidePickLocation;
  dynamic data;

  // final refreshToken = await Preferences.getRefreshToken();
  // if (refreshToken != null) {
  //   final userRepository = UserRepository();
  //   final user = await userRepository.getProfile();
  //   if (user != null) {
  //     initialRoute = AppPath.home;
  //     // data = user;
  //   }
  // } else {
  //   final authData = await Preferences.getAuthData();
  //   if (authData != null) {
  //     initialRoute =
  //         authData.userId != null ? AppPath.verifyIdCard : AppPath.signUpName;
  //     data = authData;
  //   }
  // }

  router.go(initialRoute, extra: data);

  return router;
}

Future<void> onUpdateCurrentLocation() async {
  Location location = Location();
  PermissionStatus permissionStatus = await location.requestPermission();
  if (permissionStatus == PermissionStatus.granted) {
    final currentLocation = await location.getLocation();
    if (currentLocation.latitude != null && currentLocation.longitude != null) {
      final geocode = Geocode(
        latitude: currentLocation.latitude!,
        longitude: currentLocation.longitude!,
      );
      await Preferences.saveCurrentLocation(geocode);
    }
  }
}
