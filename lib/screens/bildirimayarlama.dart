import 'package:appjam/notification/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: bildirimAyarlama(),
    );
  }
}

class bildirimAyarlama extends StatefulWidget {
  const bildirimAyarlama({Key? key}) : super(key: key);

  @override
  State<bildirimAyarlama> createState() => _bildirimAyarlamaState();
}

class _bildirimAyarlamaState extends State<bildirimAyarlama> {
  @override
  void initState() {
    super.initState();
    Bildirim.initialize(flutterLocalNotificationsPlugin);
  }

  @override
  int kalanSure = 154;
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.amber),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
            ),
            width: 200,
            height: 200,
            child: ElevatedButton(
              onPressed: () {
                Bildirim.showBigTextNotification(
                  title: "Ayın Bitmesine Az Kaldı!",
                  body:
                      "Hey acelet et! Geriye kalan $kalanSure dk. eğitimin var.",
                  fln: flutterLocalNotificationsPlugin,
                );
              },
              child: Text("Bildirim Kur"),
            ),
          ),
        ),
      ),
    );
  }
}
