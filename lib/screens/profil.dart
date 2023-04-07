import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Column(
        children: [
          Text('İsim: John Doe'),
          Text('Liderlik Sıralaması: 5'),
          Text('Bildirim Ayarları'),
          // Slider widget'ları ekleyin
        ],
      ),
    );
  }
}
