import 'package:flutter/material.dart';
import 'package:pertemuan_9/notification_service.dart';
import 'package:pertemuan_9/screens/login_page.dart';
import 'package:pertemuan_9/screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(
    firebaseMessagingBackgroundHandler,
  );

  await NotificationService.init();

  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Agit',
      navigatorKey: navigatorKey,
      initialRoute: '/',

      routes: {
        '/': (context)=> LoginPage(),
        '/home' :(context)=> HomePage()
      },
    );
  }
}