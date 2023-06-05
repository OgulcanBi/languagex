// import 'dart:developer';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:jwt_decode/jwt_decode.dart';
// import 'package:languagex/core/extensions/extension_string.dart';
// import 'package:languagex/core/services/router.gr.dart';
// import 'package:languagex/core/services/service_route.dart';
//
// import '../utils/general_data.dart';
//
// class ServiceNotification {
//   static const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'languagex_channel',
//     'Languagex High Importance Notifications',
//     description: 'This channel is used for important notifications.',
//     importance: Importance.high,
//   );
//   static var notification = FlutterLocalNotificationsPlugin();
//
//   static Future<void> configure() async {
//     await notification.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     var android = const AndroidInitializationSettings('mipmap/ic_launcher');
//     var iOS = const DarwinInitializationSettings();
//     var initPlatform = InitializationSettings(android: android, iOS: iOS);
//     await notification.initialize(
//       initPlatform,
//       onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
//       onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
//     );
//     FirebaseMessaging.instance.subscribeToTopic('languagex');
//
//     await FirebaseMessaging.instance.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//
//     if (GeneralData.getInstance().getFCMToken() == '') {
//       String token = (await FirebaseMessaging.instance.getToken()) ?? '';
//       GeneralData.getInstance().setFCMToken(token);
//       GeneralData.getInstance().setIsChangedFCMToken(true);
//       log(token, name: 'FCM Token is changed');
//     } else {
//       log(GeneralData.getInstance().getFCMToken(), name: 'FCM Token');
//     }
//
//     FirebaseMessaging.instance.onTokenRefresh.listen((token) {
//       GeneralData.getInstance().setFCMToken(token);
//       GeneralData.getInstance().setIsChangedFCMToken(true);
//       log(token, name: 'FCM Token is changed');
//     });
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       showNotification(message);
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       openDetail(message.data['Link'], false);
//     });
//
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//
//     RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
//
//     if (initialMessage != null) {
//       openDetail(initialMessage.data['Link'], true);
//     }
//   }
//
//   static void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
//     final String? payload = notificationResponse.payload;
//     if (notificationResponse.payload != null) {
//       openDetail(payload, false);
//     }
//   }
//
//   @pragma('vm:entry-point')
//   static void notificationTapBackground(NotificationResponse notificationResponse) {
//     final String? payload = notificationResponse.payload;
//     if (notificationResponse.payload != null) {
//       openDetail(payload, true);
//     }
//   }
//
//   static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//     openDetail(message.data['Link'], false);
//   }
//
//   static void showNotification(RemoteMessage message) {
//     RemoteNotification? remoteNotification = message.notification;
//     AndroidNotification? android = remoteNotification?.android;
//     if (remoteNotification != null && android != null) {
//       notification.show(
//         remoteNotification.hashCode,
//         remoteNotification.title,
//         remoteNotification.body,
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             channel.id,
//             channel.name,
//             channelDescription: channel.description,
//           ),
//         ),
//         payload: message.data['Link'],
//       );
//     }
//   }
//
//   static void openDetail(String? payload, bool isBackground) {
//     if (payload != null) {
//       if (isBackground) {
//         GeneralData.getInstance().notificationId = payload;
//       } else {
//         if (GeneralData.getInstance().getAccessToken().isNullOrEmpty() || Jwt.isExpired(GeneralData.getInstance().getAccessToken()!)) {
//           if (ServiceRoute.rootRouter.current.name != 'login') {
//             ServiceRoute.rootRouter.replaceAll([ViewLoginRoute()]);
//           }
//           GeneralData.getInstance().notificationId = payload;
//         } else {
//           ServiceRoute.rootRouter.pushNamed(payload);
//         }
//       }
//     }
//   }
// }
