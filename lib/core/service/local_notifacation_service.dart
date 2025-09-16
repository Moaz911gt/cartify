import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifacationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static onTap(NotificationResponse notificationResponse) {}
  static Future init() async {
    InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      // iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
  }

  static Future<void> showBasicNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    AndroidNotificationDetails andriod = AndroidNotificationDetails(
      'id 1',
      'basic notification',
      priority: Priority.high,
      importance: Importance.max,
    );
    NotificationDetails details = NotificationDetails(android: andriod);

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      details,
      payload: 'pay load',
    );
  }
}
