import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimationPage(),
    );
  }
}

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  int _currentIndex = 0;

  List<String> imageList = [
    'assets/t3.png',
    'assets/sanayib.png',
    'assets/google.png',
    'assets/girisimvakfi.png',
    'assets/dijitaldonusum.png'
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
    );

    _animation =
        Tween<double>(begin: 0.5, end: 1).animate(_animationController);

    _animationController.forward().whenComplete(() {
      Future.delayed(const Duration(milliseconds: 120), () {
        _animateImages();
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _animateImages() {
    if (_currentIndex < imageList.length - 1) {
      _animationController.reverse().whenComplete(() {
        setState(() {
          _currentIndex++;
        });
        _animationController.forward().whenComplete(() {
          Future.delayed(const Duration(milliseconds: 120), () {
            _animateImages();
          });
        });
      });
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Widget _buildImage() {
    return FadeTransition(
      opacity: _animation,
      child: Image.asset(imageList[_currentIndex]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildImage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        title: const Text(
          'Oyun ve Uygulama Akademisi',
          style: TextStyle(color: Colors.black),
        ),
        leading: const SizedBox(),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PhysicalModel(
                    elevation: 10,
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/oualogo.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'E-Mail Adresi',
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Lütfen mail adresinizi girin';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value ?? '';
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        if (_email == 'fatma.s' && _password == 'fatma.s123') {
                          _navigatePanel(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('E-mail adresi veya şifre hatalı'),
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Giriş Yap',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  TextButton(
                    child: const Text(
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
  }
}

void _navigatePanel(BuildContext context) {
  Navigator.of(context).pushReplacementNamed('/ana_panel');
}
