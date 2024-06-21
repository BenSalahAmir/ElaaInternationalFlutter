import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medica/MedicaPages/MedicaAuthentication/medica_splash.dart';
import 'package:medica/MedicaString/stringtranslation.dart';
import 'package:medica/MedicaThmes/medica_theme.dart';
import 'package:medica/MedicaThmes/medica_themecontroller.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'Service/WebSocketService.dart';
import 'Service/notificationServiceImp.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final NotificationServiceImp notificationService = NotificationServiceImp();
  await notificationService.init();

  runApp(MyApp(notificationService: notificationService));
}

class MyApp extends StatefulWidget {
  final NotificationServiceImp notificationService;

  const MyApp({Key? key, required this.notificationService}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MedicaThemecontroler themedata = Get.put(MedicaThemecontroler());
  late WebSocketService _webSocketService;

  @override
  void initState() {
    super.initState();

    _webSocketService = WebSocketService(
      onConnect: (StompFrame frame) {
        _webSocketService.stompClient.subscribe(
          destination: '/topic/notifications',
          callback: (frame) {
            widget.notificationService.showNotification(
              'New Notification',
              frame.body ?? 'No message body',
            );
          },
        );
      },
    );

    _webSocketService.activate();
  }

  @override
  void dispose() {
    _webSocketService.dispose();
    super.dispose();
  }

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
