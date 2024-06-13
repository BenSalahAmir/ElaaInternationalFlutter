import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServiceLocalNotification {
  final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('flutter_logo'); // Ensure correct icon path

    final DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {},
    );

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {
        // Handle notification response here if needed
      },
    );

    // Debug log
    print("Notification Service Initialized for Android");

    // Start polling for notifications
    pollForNotifications();
  }

  void pollForNotifications() async {
    // Replace with your username or userId
    String userId = '6643505a5936461884a64725';

    // Replace with your backend server URL
    String url = 'http://10.0.2.2:9098/api/notifications/user/$userId';

    while (true) {
      try {
        final response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          List notifications = json.decode(response.body);
          for (var notification in notifications) {
            showNotification(
              title: notification['title'],
              body: notification['message'],
            );
          }
        }
      } catch (e) {
        print("Error polling notifications: $e");
      }

      // Poll every 30 seconds
      await Future.delayed(Duration(seconds: 3600));
    }
  }

  NotificationDetails notificationDetails() {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      icon: 'flutter_logo', // Ensure correct icon path
    );

    const DarwinNotificationDetails iOSPlatformChannelSpecifics = DarwinNotificationDetails();

    return const NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
  }

  Future<void> showNotification({int id = 0, String? title, String? body, String? payload}) async {
    await notificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails(),
    );

    // Debug log
    print("Notification Shown: $title, $body");
  }
}
