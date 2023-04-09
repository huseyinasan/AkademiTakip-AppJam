import 'package:appjam/notification/notification.dart';
import 'package:appjam/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:percent_indicator/percent_indicator.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);
  bool _notificationsEnabled = false;

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  void _onNotificationsToggle(bool value) async {
    setState(() {
      _notificationsEnabled = value;
    });
    if (_notificationsEnabled) {
      await Bildirim();
    } else {
      await flutterLocalNotificationsPlugin.cancelAll();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person),
            ),
            const SizedBox(height: 10),
            const Text(
              'Kişi Adı',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '🔥',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(width: 5),
                Text(
                  '7',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      LinearPercentIndicator(
                        width: 300.0,
                        lineHeight: 40.0,
                        percent: 0.23,
                        backgroundColor: Colors.grey[300],
                        progressColor: Colors.lightBlue,
                      ),
                      const Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            ' %23',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Şu an ödevlerinin %23\'ünü tamamladın',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Akademi Sıralaman 174/750',
              style: TextStyle(fontSize: 18, color: Colors.lightBlue),
            ),
            ElevatedButton(
              onPressed: _selectTime,
              child: const Text('Zaman Seç'),
            ),
            const SizedBox(height: 8),
            Text(
              'Seçilen Zaman: ${_time.format(context)}',
            ),
            ListTile(
              title: const Text('Günlük Bildirimler'),
              trailing: Switch(
                value: _notificationsEnabled,
                onChanged: _onNotificationsToggle,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Geri Bildirim'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const TextField(
                                decoration: InputDecoration(
                                  hintText: "Ad Soyad",
                                ),
                              ),
                              const SizedBox(height: 20),
                              DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  hintText: "Tür",
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                ),
                                value: 'istek',
                                items: const [
                                  DropdownMenuItem(
                                    value: 'istek',
                                    child: Text('İstek'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'sikayet',
                                    child: Text('Şikayet'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'oneri',
                                    child: Text('Öneri'),
                                  ),
                                ],
                                onChanged: (value) {},
                              ),
                              const SizedBox(height: 20),
                              const TextField(
                                decoration: InputDecoration(
                                  hintText: 'Konu',
                                ),
                              ),
                              const SizedBox(height: 20),
                              const TextField(
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  hintText: "Geri bildiriminizi buraya yazın",
                                  alignLabelWithHint: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('İptal'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement your feedback functionality here
                      Navigator.of(context).pop();
                    },
                    child: const Text('Gönder'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.feedback),
      ),
    );
  }
}

void _navigateLogin(BuildContext context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) {
      return const LoginPage();
    },
  ));
}
