import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> onHandleBackgroundMessage(RemoteMessage message) async {
  print('Handling a background message body: ${message.notification?.body}');
  // Process the message as needed, but avoid depending on external parameters.
}

class NotificationRepository {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late void Function(NotificationResponse) onNotificationResponse;

  NotificationRepository({required this.onNotificationResponse}) {
    _initializeLocalNotifications();
    _initializeFCM();
  }

  void _initializeLocalNotifications() {
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOSSettings = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: androidSettings,
      iOS: iOSSettings,
    );

    _localNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onNotificationResponse,
    );
  }

  void _initializeFCM() async {
    await _firebaseMessaging.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showNotification(message);
    });

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        _showNotification(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen(_showNotification);
    FirebaseMessaging.onBackgroundMessage(onHandleBackgroundMessage);
  }

  void _showNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification != null) {
      const androidDetails = AndroidNotificationDetails(
        'your_channel_id',
        'Your Channel Name',
        channelDescription: 'Your channel description',
        importance: Importance.max,
        priority: Priority.high,
      );
      const iOSDetails = DarwinNotificationDetails();
      const notificationDetails = NotificationDetails(
        android: androidDetails,
        iOS: iOSDetails,
      );

      await _localNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        notificationDetails,
        payload: jsonEncode(message.data),
      );
    }
  }

  Future<String?> getDeviceToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    return token;
  }
}
