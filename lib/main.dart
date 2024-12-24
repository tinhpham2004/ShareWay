import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:share_way_frontend/core/utils/enums/message_type_enum.dart';
import 'package:share_way_frontend/core/utils/enums/ride_status_enum.dart';
import 'package:share_way_frontend/data/api/chat/response/init_call_response/init_call_data_response.dart';
import 'package:share_way_frontend/data/api/chat/response/init_call_response/init_call_response.dart';
import 'package:share_way_frontend/domain/chat/chat_repository.dart';
import 'package:share_way_frontend/domain/chat/input/update_call_input.dart';
import 'package:share_way_frontend/domain/chat/output/init_call_output/init_call_output.dart';
import 'package:share_way_frontend/domain/fcm/models/accept_ride_request/accept_ride_request.dart';
import 'package:share_way_frontend/domain/fcm/models/accept_ride_request/accept_ride_request_data.dart';
import 'package:share_way_frontend/domain/fcm/models/new_give_ride_request/new_give_ride_request.dart';
import 'package:share_way_frontend/domain/fcm/models/new_give_ride_request/new_give_ride_request_data.dart';
import 'package:share_way_frontend/domain/fcm/models/new_hitch_ride_request/new_hitch_ride_request.dart';
import 'package:share_way_frontend/domain/fcm/models/new_hitch_ride_request/new_hitch_ride_request_data.dart';
import 'package:share_way_frontend/domain/fcm/notification_repository.dart';
import 'package:share_way_frontend/domain/local/preferences.dart';
import 'package:share_way_frontend/domain/map/output/give_ride_recommendation_ouput/give_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/domain/map/output/hitch_ride_recommendation_ouput/hitch_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/domain/shared/models/geocode.dart';
import 'package:share_way_frontend/domain/user/user_repository.dart';
import 'package:share_way_frontend/domain/web_socket/web_socket_repository.dart';
import 'package:share_way_frontend/firebase_options.dart';
import 'package:share_way_frontend/my_app.dart';
import 'package:share_way_frontend/presentation/chat/bloc/chat_rooms_bloc.dart';
import 'package:share_way_frontend/presentation/chat/bloc/chat_rooms_state.dart';
import 'package:share_way_frontend/presentation/chat/sub_screens/chat_detail/bloc/chat_detail_bloc.dart';
import 'package:share_way_frontend/presentation/chat/sub_screens/chat_detail/bloc/chat_detail_state.dart';
import 'package:share_way_frontend/router/app_path.dart';
import 'package:share_way_frontend/router/app_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await initializeApp();
  final router = await initializeRouter();
  runApp(MyApp(router: router));
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initNotification();
  // initializeWebSocket();
  initializeMapbox();
  await onUpdateCurrentLocation();
}

Future<GoRouter> initializeRouter() async {
  GoRouter router = AppRouter(navigatorKey).router;
  String initialRoute = AppPath.onboarding;
  dynamic extra;

  final refreshToken = await Preferences.getRefreshToken();
  if (refreshToken != null) {
    final userRepository = UserRepository();
    final user = await userRepository.getProfile();
    if (user != null) {
      initialRoute = AppPath.home;
      // data = user;
    }
  } else {
    final authData = await Preferences.getAuthData();
    if (authData != null) {
      initialRoute =
          authData.userId != null ? AppPath.verifyIdCard : AppPath.signUpName;
      extra = authData;
    }
  }

  router.go(initialRoute, extra: extra);

  return router;
}

Future<void> initNotification() async {
  try {
    final notificationRepository =
        NotificationRepository(onNotificationResponse: onNotificationResponse);
    final deviceToken = await notificationRepository.getDeviceToken();
    if (deviceToken != null) {
      final userRepository = UserRepository();
      final response = await userRepository.registerDeviceToken(deviceToken);
      if (response) {
        print('Device token registered with token: $deviceToken');
      }
    }
  } catch (e) {
    print(e);
  }
}

void onNotificationResponse(NotificationResponse response) {
  final payload = response.payload;

  if (payload != null) {
    String type = jsonDecode(payload)['type'];
    switch (type) {
      case 'new-give-ride-request':
        _handleNewGiveRideRequest(response);
        break;
      case 'new-hitch-ride-request':
        _handleNewHitchRideRequest(response);
        break;
      case 'accept-give-ride-request':
        _handleAcceptedGiveRideRequest(response);
        break;
      case 'accept-hitch-ride-request':
        _handleAcceptedHitchRideRequest(response);
        break;
      case 'cancel-give-ride-request':
        _handleCancelGiveRideRequest(response);
        break;
      case 'cancel-hitch-ride-request':
        _handleCancelHitchRideRequest(response);
        break;
      case 'initiate-call':
        _handleInitiateCall(response);
        break;
      default:
        print('Unknown message type: $type');
    }
  }
}

void _handleNewGiveRideRequest(NotificationResponse message) {
  final data = jsonDecode(message.payload!);
  final newGiveRideRequest = NewGiveRideRequest.fromJson(data);
  if (newGiveRideRequest.data != null) {
    const initialRoute = AppPath.hitchRideReccomendationDetail;
    final extra = GiveRideRecommendationOuput.fromNewGiveRideRequest(
            newGiveRideRequest.data ?? NewGiveRideRequestData())
        .copyWith(status: RideStatusEnum.RECEIVING);
    navigatorKey.currentContext!.go(initialRoute, extra: extra);
  }
}

void _handleNewHitchRideRequest(NotificationResponse message) {
  final data = jsonDecode(message.payload!);

  final newHitchRideRequest = NewHitchRideRequest.fromJson(data);
  if (newHitchRideRequest.data != null) {
    const initialRoute = AppPath.giveRideRecommendationDetail;
    final extra = HitchRideRecommendationOuput.fromNewHitchRideRequest(
            newHitchRideRequest.data ?? NewHitchRideRequestData())
        .copyWith(status: RideStatusEnum.RECEIVING);
    navigatorKey.currentContext!.go(initialRoute, extra: extra);
  }
}

void _handleAcceptedGiveRideRequest(NotificationResponse message) {
  final data = jsonDecode(message.payload!);

  final acceptRideRequest = AcceptRideRequest.fromJson(data);
  if (acceptRideRequest.data != null) {
    const initialRoute = AppPath.hitchRideReccomendationDetail;
    final extra = GiveRideRecommendationOuput.fromAcceptRideRequest(
            acceptRideRequest.data ?? AcceptRideRequestData())
        .copyWith(status: RideStatusEnum.ACCEPTED);
    navigatorKey.currentContext!.go(initialRoute, extra: extra);
  }
}

void _handleAcceptedHitchRideRequest(NotificationResponse message) {
  final data = jsonDecode(message.payload!);

  final acceptRideRequest = AcceptRideRequest.fromJson(data);
  if (acceptRideRequest.data != null) {
    const initialRoute = AppPath.giveRideRecommendationDetail;
    final extra = HitchRideRecommendationOuput.fromAcceptRideRequest(
            acceptRideRequest.data ?? AcceptRideRequestData())
        .copyWith(status: RideStatusEnum.ACCEPTED);
    navigatorKey.currentContext!.go(initialRoute, extra: extra);
  }
}

void _handleCancelGiveRideRequest(NotificationResponse message) {
  // Handle the cancelled give ride request here
  print('Handling cancelled give ride request: $message');
}

void _handleCancelHitchRideRequest(NotificationResponse message) {
  // Handle the cancelled hitch ride request here
  print('Handling cancelled hitch ride request: $message');
}

void _handleInitiateCall(NotificationResponse message) async {
  final data = jsonDecode(message.payload!);
  final initCallDataResponse =
      InitCallDataResponse.fromJson(jsonDecode(data['data']));
  const initialRoute = AppPath.call;
  final initCallOutput =
      InitCallOutput.fromApiModel(InitCallResponse(data: initCallDataResponse));
  if (message.actionId == 'accept') {
    final chatRoomsBloc = ChatRoomsBloc();
    await chatRoomsBloc.onFetchChatRooms();
    chatRoomsBloc.onFetchAssets(navigatorKey.currentContext!);
    chatRoomsBloc.emit(chatRoomsBloc.state.copyWith(
      selectedChat: chatRoomsBloc.state.chatRooms.firstWhereOrNull(
        (e) => e.roomId == initCallOutput.roomId,
      ),
    ));
    final chatDetailBloc = ChatDetailBloc(chatRoomsBloc: chatRoomsBloc)
      ..onStart();
    chatDetailBloc
        .emit(chatDetailBloc.state.copyWith(initCallOutput: initCallOutput));
    navigatorKey.currentContext!.push(initialRoute, extra: chatDetailBloc);
  } else if (message.actionId == 'reject') {
    final _chatRepository = ChatRepository();
    final input = UpdateCallInput(
      callId: initCallOutput.callId,
      type: MessageTypeEnum.MISSED_CALL,
      roomId: initCallOutput.roomId,
      duration: 0,
      receiverId: await _getCurrentReceiverId(initCallOutput.callerId ?? '', initCallOutput.receiverId ?? ''),
    );
    final response = await _chatRepository.updateCallStatus(input);
  }
}

Future<String> _getCurrentReceiverId(String firstId, String secondId) async {
  final userId = await Preferences.getUserId();
  return firstId == userId ? secondId : firstId;
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

void initializeMapbox() {
  MapboxOptions.setAccessToken(dotenv.env['MAPBOX_KEY'] ?? '');
}

void initializeWebSocket() {
  final webSocketRepository = WebSocketRepository();
  webSocketRepository.connect();
}
