import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationRepository {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationRepository() {
    _initializeLocalNotifications();
    _initializeFCM();
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // Handle background message
    print("Handling a background message: ${message.messageId}");
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
      onDidReceiveNotificationResponse: _onNotificationResponse,
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
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  void _showNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification != null) {
      const androidDetails = AndroidNotificationDetails(
          'your_channel_id', 'Your Channel Name',
          channelDescription: 'Your channel description',
          importance: Importance.max,
          priority: Priority.high,
          actions: [
            AndroidNotificationAction('accept', 'Accept',
                showsUserInterface: true),
            AndroidNotificationAction('reject', 'Reject',
                showsUserInterface: true),
          ]);
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
      );
    }
  }

  void _onNotificationResponse(NotificationResponse response) {
    if (response.actionId == 'accept') {
      _handleAcceptAction();
    } else if (response.actionId == 'reject') {
      _handleRejectAction();
    }
  }

  void _handleAcceptAction() {
    // Handle the "Accept" action here
    print("Accepted notification action");
  }

  void _handleRejectAction() {
    // Handle the "Reject" action here
    print("Rejected notification action");
  }

  Future<String?> getDeviceToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    return token;
  }
}
