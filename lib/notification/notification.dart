import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Bildirim {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        new AndroidInitializationSettings("mipmap/launcher_icon");
    var iOSInitialize = new DarwinInitializationSettings();
    var initializationsSettings = new InitializationSettings(
        android: androidInitialize, iOS: iOSInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationsSettings);
  }

  static Future showBigTextNotification(
      {var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlatformChannelsSpecifics =
        new AndroidNotificationDetails(
      "isim_ver",
      "kanal_ismi",
      playSound: true,
      //sound: RawResourceAndroidNotificationSound("notification"),
      importance: Importance.max,
      priority: Priority.high,
    );

    var not = NotificationDetails(
      android: androidPlatformChannelsSpecifics,
      iOS: DarwinNotificationDetails(),
    );
    await fln.show(0, title, body, not);
  }
}
