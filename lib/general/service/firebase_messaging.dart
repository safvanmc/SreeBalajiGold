import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:sree_balagi_gold/general/core/di/injection.dart';

@lazySingleton
class FirebaseFCMApi {
  final firebaseMessaging = sl<FirebaseMessaging>();
  final _androidChannel = const AndroidNotificationChannel(
    'high_importent_Channel',
    'High Importance message',
    description: 'Important notifications',
    importance: Importance.high,
  );
  final _localNotification = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    final fCMToken = await firebaseMessaging.getToken();
    log('FCM Token: $fCMToken');
    await initPushNotifications();
    await initLocalNotification(() {
      // Define your foreground message handling here if needed
    });
  }

  Future<void> initLocalNotification(
    void Function() onOpenForgroundMsg,
  ) async {
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const ios = DarwinInitializationSettings();
    const settings = InitializationSettings(
      android: android,
      iOS: ios,
    );
    await _localNotification.initialize(
      settings,
      onDidReceiveNotificationResponse: (notificationResponse) {
        final payload = notificationResponse.payload;
        if (payload != null) {
          onOpenForgroundMsg();
          log('Notification Tapped');
        }
      },
    );
    final platform = _localNotification.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  Future<void> initPushNotifications() async {
    await firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen(
      (message) async {
        final notification = message.notification;
        if (notification == null) return;

        BigPictureStyleInformation? bigPictureStyleInformation;

        if (notification.android?.imageUrl != null) {
          final response =
              await http.get(Uri.parse(notification.android!.imageUrl!));
          bigPictureStyleInformation = BigPictureStyleInformation(
              ByteArrayAndroidBitmap.fromBase64String(
                  base64Encode(response.bodyBytes)));
        }

        _localNotification.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidChannel.id,
              _androidChannel.name,
              channelDescription: _androidChannel.description,
              icon: '@drawable/ic_launcher',
              styleInformation: bigPictureStyleInformation,
              priority: Priority.high,
              importance: Importance.max,
            ),
          ),
          payload: jsonEncode(message.toMap()),
        );
      },
    );
  }

  void tapFcmMessage(void Function(RemoteMessage? message) onReceived) {
    firebaseMessaging.getInitialMessage().then(onReceived);
    FirebaseMessaging.onMessageOpenedApp.listen(onReceived);
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  log('Background Message Title: ${message.notification?.title}');
  log('Background Message Body: ${message.notification?.body}');
}
