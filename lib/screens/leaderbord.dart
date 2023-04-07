import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  final List<String> _users = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Emma',
    'Frank',
    'Grace',
    'Henry',
    'Isabella',
    'Jack',
  ];

  final Map<String, int> _scores = {
    'Alice': 42,
    'Bob': 37,
    'Charlie': 29,
    'David': 24,
    'Emma': 18,
    'Frank': 12,
    'Grace': 9,
    'Henry': 4,
    'Isabella': 2,
    'Jack': 1,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          String user = _users[index];
          int score = _scores[user] ?? 0;
          return ListTile(
            leading: CircleAvatar(
              child: Text(user.substring(0, 1)),
            ),
            title: Text(user),
            trailing: Text(score.toString()),
          );
        },
      ),
    );
  }
}
