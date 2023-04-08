import 'package:appjam/screens/leaderbord.dart';
import 'package:appjam/screens/profil.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class AnaPanel extends StatefulWidget {
  const AnaPanel({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnaPanelState createState() => _AnaPanelState();
}
//
class _AnaPanelState extends State<AnaPanel> {
  bool showMonthlyProgress = true;
  void onProgressBarPressed(String label) {
    print('$label progress bar pressed');
  }

  final List<Map<String, dynamic>> totalProgressData = [
    {
      'name': 'Flutter / Unity',
      'value': 0.72,
      'color': Colors.blue,
      "course": "14/21",
      "kalan_sure": 740,
    },
    {
      'name': 'Google Proje Yönetimi',
      'value': 0.83,
      'color': Colors.green,
      "course": "5/6",
      "kalan_sure": 160,
    },
    {
      'name': 'Girişimcilik',
      'value': 0.84,
      'color': Colors.yellow,
      "course": "16/21",
      "kalan_sure": 90,
    },
    {
      'name': 'İngilizce',
      'value': 0.77,
      'color': Colors.red,
      "course": "27/34",
      "kalan_sure": 360,
    },
  ];

  final List<Map<String, dynamic>> monthlyProgressData = [
    {
      'name': 'Flutter / Unity',
      'value': 0.82,
      'color': Colors.blue,
      "course": "14/16",
      "kalan_sure": 60,
    },
    {
      'name': 'Google Proje Yönetimi',
      'value': 1.0,
      'color': Colors.green,
      "course": "5/4",
      "kalan_sure": 0,
    },
    {
      'name': 'Girişimcilik',
      'value': 0.72,
      'color': Colors.yellow,
      "course": "16/18",
      "kalan_sure": 40,
    },
    {
      'name': 'İngilizce',
      'value': 0.92,
      'color': Colors.red,
      "course": "27/28",
      "kalan_sure": 25,
    },
  ];

  List<Map<String, dynamic>> get progressData =>
      showMonthlyProgress ? totalProgressData : monthlyProgressData;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth * 0.05;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Görev Takibi',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Icon(
                  HeroIcons.fire,
                  size: 30,
                  color: Colors.orange,
                ),
              ),
              Text(
                'x5',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        leading: const SizedBox(),
        actions: [

          Container(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: const Icon(
                Icons.person,
                size: 34,
              ),
              color: Colors.white,
              onPressed: () {
                _navigateProfil(context);
              },
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bu Ay',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Switch(
                value: showMonthlyProgress,
                onChanged: (bool value) {
                  setState(() {
                    showMonthlyProgress = value;
                  });
                },
                activeColor: Colors.blue,
                inactiveThumbColor: Colors.blue,
                activeTrackColor: Colors.red,
                inactiveTrackColor: Colors.green,
              ),
              const Text('Genel',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.shade700],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: const Center(
              child: Text(
                'İlerleme Düzeyleri',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              itemCount: progressData.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    CustomProgressBar(
                      label: progressData[index]['name'],
                      value: progressData[index]['value'],
                      color: progressData[index]['color'],
                      course: progressData[index]["course"],
                      kalan_sure: progressData[index]["kalan_sure"],
                      onPressed: () =>
                          onProgressBarPressed(progressData[index]['name']),
                    ),
                    if (index < progressData.length - 1)
                      const Divider(
                        thickness: 2,
                      ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: FloatingActionButton(
                  onPressed: () {
                    _navigateLeaderbord(context);
                  },
                  child: Icon(Icons.leaderboard),
                ),
              ),
            ],
          ),
        ],
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

class CustomProgressBar extends StatefulWidget {
  final String label;
  final double value;
  final Color color;
  final String course;
  final int kalan_sure;
  final VoidCallback? onPressed;

  const CustomProgressBar({
    Key? key,
    required this.label,
    required this.value,
    required this.color,
    required this.course,
    required this.kalan_sure,
    this.onPressed,
  }) : super(key: key);

  @override
  _CustomProgressBarState createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        if (widget.onPressed != null) {
          setState(() {
            _isPressed = true;
          });
        }
      },
      onTapUp: (details) {
        if (widget.onPressed != null) {
          widget.onPressed!();
          setState(() {
            _isPressed = false;
          });
        }
      },
      onTapCancel: () {
        if (widget.onPressed != null) {
          setState(() {
            _isPressed = false;
          });
        }
      },
      child: ExpansionTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 8),
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Stack(
                children: [
                  Container(
                    height: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade300,
                    ),
                    width: constraints.maxWidth,
                  ),
                  Container(
                    height: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: _isPressed
                          ? widget.color.withOpacity(0.6)
                          : widget.color,
                    ),
                    width: constraints.maxWidth * widget.value,
                  ),
                ],
              );
            }),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'İlerlemen: ${(widget.value * 100).toInt()}%',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Akademi Ortalaması: ${(widget.value * 81).toInt()}%',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        children: [
          // Add any content that you want to display when the widget is expanded
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              children: [
                Text(
                  'Modül İlerlemesi: ${widget.course}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Kalan Ders Süresi: ${widget.kalan_sure} dakika',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
