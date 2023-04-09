import 'package:akademi_gorev_takip/screens/ana_panel.dart';
import 'package:akademi_gorev_takip/screens/leaderbord.dart';
import 'package:akademi_gorev_takip/screens/login_page.dart';
import 'package:akademi_gorev_takip/screens/profil.dart';
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
        '/login': (context) => const LoginPage(),
        '/ana_panel': (context) => const AnaPanel(),
        '/leaderboard': (context) => LeaderboardPage(),
        '/profil': (context) => const ProfilePage(),
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
