import 'package:appjam/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:appjam/screens/leaderbord.dart';
void main() {
  runApp(const MyApp());
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