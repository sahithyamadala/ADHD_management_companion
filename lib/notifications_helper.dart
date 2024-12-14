import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  try {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
            '@mipmap/ic_launcher'); // Ensure this icon exists

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  } catch (e) {
    print("Error initializing notifications: $e");
  }
}

Future<void> scheduleReminder() async {
  try {
    const androidDetails = AndroidNotificationDetails(
      'reminder_channel_id', // Channel ID
      'Reminders', // Channel name
      channelDescription: 'This channel is for reminder notifications',
      importance: Importance.max,
      priority: Priority.high,
      enableVibration: true,
      timeoutAfter: 3000,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.schedule(
      0,
      'Reminder Title',
      'This is your reminder notification.',
      DateTime.now().add(const Duration(seconds: 5)), // Local time scheduling
      notificationDetails,
      androidAllowWhileIdle: true,
    );
  } catch (e) {
    print("Error scheduling notification: $e");
  }
}

extension on FlutterLocalNotificationsPlugin {
  schedule(int i, String s, String t, DateTime add,
      NotificationDetails notificationDetails,
      {required bool androidAllowWhileIdle}) {}
}
