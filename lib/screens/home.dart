import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/notificationservice/local_notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // app opened
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print('Message data: ${message.notification!.title}');
        print('Message data: ${message.notification!.body}');
        print(message.data['path2']);
        Navigator.pushNamed(context, message.data['path2']);
        LocalNotificationService.createanddisplaynotification(message);
      }
    });

    // app in background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.notification != null) {
        print(
            'Message data: ----------------------------${message.notification!.title}');
        print('Message data: ${message.notification!.body}');
        print(message.data['path']);
        LocalNotificationService.createanddisplaynotification(message);
        Navigator.pushNamed(context, message.data['path']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            'Push Notification',
            textScaleFactor: 2,
          ),
        ),
      ),
    );
  }
}
