import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            child: Icon(Icons.person),
          ),
          SizedBox(height: 10),
          Text(
            'Kişi Adı',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
          SizedBox(height: 50),
          CircularPercentIndicator(
            radius: 120,
            lineWidth: 10,
            percent: 0.23, // Replace with actual progress
            center: Text(
              '23%',
              style: TextStyle(fontSize: 24),
            ),
            progressColor: Colors.blue,
            backgroundColor: Colors.grey.shade300,
          ),
          SizedBox(height: 30),
          Text(
            'Şu an ödevlerinin %23\'ünü tamamladın',
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(height: 10),
          Text(
            'Tablo Sıralaması 174/750',
            style: TextStyle(fontSize: 18),
          ),


        ],
      ),
    );
  }
}
//