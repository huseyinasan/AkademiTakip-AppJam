import 'package:appjam/screens/leaderbord.dart';
import 'package:appjam/screens/profil.dart';
import 'package:flutter/material.dart';

class AnaPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ana Sayfa'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              _navigateProfil(context);
            },
          ),
        ],
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Liderlik',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback),
            label: 'Geribildirim',
          ),
        ],
        onTap: (index) {
          _navigateLeaderbord(context);
        },
      ),
    );
  }
}

void _navigateProfil(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) {
      return ProfilePage();
    },
  ));
}

void _navigateLeaderbord(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) {
      return LeaderboardPage();
    },
  ));
}
