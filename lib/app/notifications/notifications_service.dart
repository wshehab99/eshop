// import 'dart:convert';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import '../../resources/routing/route_manager.dart';
// import '../support/helpers.dart';
//
// @pragma('vm:entry-point')
// Future<void> backgroundMessage(RemoteMessage message) async {
//   NotificationService.showNotification(message.notification, message.toMap());
// }
//
// abstract class NotificationService {
//   static final FirebaseMessaging _firebaseInstance = FirebaseMessaging.instance;
//   static const _androidChannel = AndroidNotificationChannel(
//     "high_importance_channel",
//     "High Importance Notification",
//     description: 'this channel is required for important notifications',
//     importance: Importance.high,
//   );
//   static final _localNotifications = FlutterLocalNotificationsPlugin();
//   static Future<void> initNotification() async {
//     await _firebaseInstance.requestPermission();
//     initPushNotifications();
//     initLocalNotifications();
//   }
//
//   static Future<void> handleMessage(RemoteMessage? message) async {
//     print(message);
//     if (message == null) return;
//     print(currentContext);
//   }
//
//   static Future initPushNotifications() async {
//     FirebaseMessaging.onBackgroundMessage(backgroundMessage);
//     await setForegroundNotification();
//     FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//     FirebaseMessaging.onMessage.listen(handleForegroundMessage);
//   }
//
//   static Future initLocalNotifications() async {
//     const ios = DarwinInitializationSettings(
//       requestSoundPermission: true,
//       requestBadgePermission: true,
//       requestAlertPermission: true,
//     );
//     const android = AndroidInitializationSettings('@drawable/ic_launcher');
//     const settings = InitializationSettings(android: android, iOS: ios);
//     await _localNotifications.initialize(
//       settings,
//       onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
//     );
//   }
//
//   static Future handleForegroundMessage(RemoteMessage event) async {
//     final notification = event.notification;
//     if (notification == null) return;
//     // currentContext!.read<MainCubit>().home(refresh: true);
//     showNotification(notification, event.toMap());
//   }
//
//   static Future<void> showNotification(
//           RemoteNotification? notification, Map<String, dynamic> payLoad) =>
//       _localNotifications.show(
//         notification.hashCode,
//         notification?.title,
//         notification?.body,
//         NotificationDetails(
//           android: _androidNotificationDetails,
//           iOS: _iosNotificationsDetails,
//         ),
//         payload: jsonEncode(payLoad),
//       );
//
//   static void onDidReceiveNotificationResponse(NotificationResponse details) {
//     // onDidReceiveLocalNotification(details);
//   }
//
//   static AndroidNotificationDetails get _androidNotificationDetails =>
//       AndroidNotificationDetails(
//         _androidChannel.id,
//         _androidChannel.name,
//         channelDescription: _androidChannel.description,
//         icon: '@drawable/ic_launcher',
//         importance: Importance.max,
//         priority: Priority.high,
//         ticker: 'fullScreenIntent',
//       );
//   static const DarwinNotificationDetails _iosNotificationsDetails =
//       DarwinNotificationDetails(sound: 'notification.aiff');
//   static Future<void> setForegroundNotification() =>
//       FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//         alert: true,
//         badge: true,
//         sound: true,
//       );
//   static Future<String?> token() => _firebaseInstance.getToken();
// }
