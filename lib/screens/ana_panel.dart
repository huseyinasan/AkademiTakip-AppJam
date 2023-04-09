import 'package:flutter/material.dart';

class AnaPanel extends StatefulWidget {
  const AnaPanel({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnaPanelState createState() => _AnaPanelState();
}

//
class _AnaPanelState extends State<AnaPanel> {
  bool showMonthlyProgress = true;
  void onProgressBarPressed(String label) {}

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
                child: Text("🔥"),
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
                _navigateProfile(context);
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
                'Aylık',
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
              const Text('Tüm Zamanlar',
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
                    Column(
                      children: [
                        CustomProgressBar(
                          label: progressData[index]['name'],
                          value: progressData[index]['value'],
                          color: progressData[index]['color'],
                          course: progressData[index]["course"],
                          kalanSure: progressData[index]["kalan_sure"],
                          onPressed: () =>
                              onProgressBarPressed(progressData[index]['name']),
                        ),
                      ],
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
                    _navigateLeaderboard(context);
                  },
                  backgroundColor: Colors.blue,
                  child: const Icon(
                    Icons.leaderboard,
                    color: Color.fromARGB(255, 253, 241, 5),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _navigateProfile(BuildContext context) {
  Navigator.pushNamed(context, '/profil');
}

void _navigateLeaderboard(BuildContext context) {
  Navigator.pushNamed(context, '/leaderboard');
}

class CustomProgressBar extends StatefulWidget {
  final String label;
  final double value;
  final Color color;
  final String course;
  final int kalanSure;
  final VoidCallback? onPressed;

  const CustomProgressBar({
    Key? key,
    required this.label,
    required this.value,
    required this.color,
    required this.course,
    required this.kalanSure,
    this.onPressed,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        elevation: 5,
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
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Akademi Ortalaması: ${(widget.value * 81).toInt()}%',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          children: [
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
                    'Kalan Ders Süresi: ${widget.kalanSure} dakika',
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
      ),
    );
  }
}
