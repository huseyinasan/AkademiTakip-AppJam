import 'package:appjam/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:appjam/screens/leaderbord.dart';
void main() {
  runApp(const MyApp());
  User Ahmet = User("Ahmet", 10, 5, 7, 100, 50, 70, 150, 1000);
  User Mehmet = User("Mehmet", 8, 3, 4, 80, 40, 60, 120, 800);
  User Ayse = User("Ayşe", 12, 7, 10, 120, 60, 90, 180, 1200);
  User Fatma = User("Fatma", 6, 2, 2, 60, 30, 45, 90, 600);
  User Ali = User("Ali", 15, 9, 12, 150, 75, 110, 225, 1500);
  User Veli = User("Veli", 4, 1, 1, 40, 20, 30, 60, 400);
  User Mert = User("Mert", 20, 12, 15, 200, 100, 150, 300, 2000);

  late final List<User> users = [Ahmet, Mehmet, Ayse, Fatma, Ali, Veli, Mert];
  // for (var user in users) {
  //   print('${user.username}: ${user.weeklyPuan}');
  }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );

  }
}
//