import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaPages/MedicaAuthentication/medica_splash.dart';
import 'package:medica/MedicaString/stringtranslation.dart';
import 'package:medica/MedicaThmes/medica_theme.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:medica/Service/NotificationServiceLocalNotification.dart';

final navigatorKey = GlobalKey<NavigatorState>();
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
NotificationServiceLocalNotification notificationService = NotificationServiceLocalNotification();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await notificationService.initNotification();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themedata = Get.put(MedicaThemecontroler());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MedicaMythemes.lightTheme,
      darkTheme: MedicaMythemes.darkTheme,
      fallbackLocale: const Locale('en', 'US'),
      translations: Apptranslation(),
      locale: const Locale('en', 'US'),
      home: const MedicaSplash(),
    );
  }
}
