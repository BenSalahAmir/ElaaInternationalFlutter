import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServiceLocalNotification {
  final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('logo'); // Ensure correct icon path

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
  }

  NotificationDetails notificationDetails() {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      icon: 'logo', // Ensure correct icon path
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
