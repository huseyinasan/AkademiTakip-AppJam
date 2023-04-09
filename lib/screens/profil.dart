import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
          )
        ],
      ),
      body: Column(
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
                '🔥', // Replace with your desired emoji
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
        ],
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
