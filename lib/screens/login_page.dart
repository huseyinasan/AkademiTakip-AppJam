import 'package:appjam/screens/ana_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _username = 'a';
  String _password = 'a';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        title: Text(
          'Oyun ve Uygulama Akademisi',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PhysicalModel(
                    elevation: 10,
                    color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),

                    child: Container(
                      child: Image.asset(
                        'assets/logo.png',
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Kullanıcı Adı',
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Lütfen kullanıcı adınızı girin';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _username = value ?? '';
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Şifre',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Lütfen şifrenizi girin';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value ?? '';
                    },
                  ),
                  ElevatedButton(
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Giriş Yap',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        if (_username == 'a' && _password == 'a') {
                          _navigatePanel(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Kullanıcı adı veya şifre hatalı'),
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextButton(
                    child: Text(
                      'Şifrenizi mi unuttunuz?',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }}

void _navigatePanel(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) {
      return AnaPanel();
    },
  ));
}
//