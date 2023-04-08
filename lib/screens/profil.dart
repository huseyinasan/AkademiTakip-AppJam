import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
          )
        ],
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
            style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
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
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    new LinearPercentIndicator(
                      width: 300.0,
                      lineHeight: 40.0,
                      percent: 0.23,
                      backgroundColor: Colors.grey[300],
                      progressColor: Colors.lightBlue,
                    ),
                    Positioned.fill(
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



          SizedBox(height: 30),

          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
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
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
          ),


          SizedBox(height: 20),
          Text(
            'Akademi Sıralaman 174/750',
            style: TextStyle(fontSize: 18,
            color: Colors.lightBlue),
          ),
        ],
      ),




      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Geri Bildirim'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Ad Soyad",
                                ),
                              ),

                              SizedBox(height: 20),
                              DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  hintText: "Tür",
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                ),
                                value: 'istek',
                                items: [
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
                              SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Konu',
                                ),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  hintText: "Geri bildiriminizi buraya yazın",
                                  alignLabelWithHint: true,
                                  contentPadding:
                                  EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                    child: Text('İptal'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement your feedback functionality here
                      Navigator.of(context).pop();
                    },
                    child: Text('Gönder'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.feedback),
      ),



    );






  }
}

