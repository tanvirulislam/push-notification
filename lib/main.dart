import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/notificationservice/local_notification_service.dart';
import 'package:push_notification/screens/screen.dart';
import 'package:push_notification/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LocalNotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  // final fcmToken = await FirebaseMessaging.instance.getToken();
  // print("${fcmToken}-----------------");
  runApp(const MyApp());
}

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PushNotification',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: SplashScreen(),
      routes: {
        // 'onscreen': (context) => OnScreen(),
        'recommanded': (context) => OnBackgroundMessage(),
      },
    );
  }
}
