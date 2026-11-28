import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
@pragma('vm:entry-point')
Future<void>firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform
  );
  debugPrint('[FCM] Pesan BACKGROUND: ${message.messageId}');
  debugPrint('[FCM] Data: ${message.data}');
}

class NotificationService {
  NotificationService._();
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotif = FlutterLocalNotificationsPlugin();
  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'high_importance_channel', 
    'Notifikasi Penting tuh', 
    description: 'Channel untuk notifikasi dari Firebase Cloud Messaging',
    importance: Importance.max,
  );
  static Future<void> init() async{
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true
    );
    debugPrint('[FCM] Status izin: ${settings.authorizationStatus}');
  }

  

}