import 'package:appjam/screens/ana_panel.dart';
import 'package:appjam/screens/leaderbord.dart';
import 'package:appjam/screens/login_page.dart';
import 'package:appjam/screens/profil.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimationPage(),
      initialRoute: '/animasyon', // uygulamanın ilk rotası
      routes: {
        '/animasyon': (context) => AnimationPage(),
        '/login': (context) => LoginPage(),
        '/ana_panel': (context) => AnaPanel(),
        '/leaderboard': (context) => LeaderboardPage(),
        '/profil': (context) => ProfilePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => AnimationPage());
        }
        return null;
      },
    );
  }
}
