import 'package:flutter/material.dart';

class User {
  String _username;
  int _aylikLectureCompletion;
  int _aylikStreak;
  int _aylikSocial;
  int _alltimeLectureCompletion;
  int _alltimeStreak;
  int _alltimeSocial;
  late int _aylikPuan;
  late int _alltimePuan;

  User(
      this._username,
      this._aylikLectureCompletion,
      this._aylikStreak,
      this._aylikSocial,
      this._alltimeLectureCompletion,
      this._alltimeStreak,
      this._alltimeSocial,
      this._aylikPuan,
      this._alltimePuan);

  User.initialize(
      this._username,
      this._aylikLectureCompletion,
      this._aylikStreak,
      this._aylikSocial,
      this._alltimeLectureCompletion,
      this._alltimeStreak,
      this._alltimeSocial);

  String get username => _username;

  set username(String username) => _username = username;

  int get aylikLectureCompletion => _aylikLectureCompletion;

  set aylikLectureCompletion(int aylikLectureCompletion) =>
      _aylikLectureCompletion = aylikLectureCompletion;

  int get aylikStreak => _aylikStreak;

  set aylikStreak(int aylikStreak) => _aylikStreak = aylikStreak;

  int get aylikSocial => _aylikSocial;

  set aylikSocial(int aylikSocial) => _aylikSocial = aylikSocial;

  int get alltimeLectureCompletion => _alltimeLectureCompletion;

  set alltimeLectureCompletion(int alltimeLectureCompletion) =>
      _alltimeLectureCompletion = alltimeLectureCompletion;

  int get alltimeStreak => _alltimeStreak;

  set alltimeStreak(int alltimeStreak) => _alltimeStreak = alltimeStreak;

  int get alltimeSocial => _alltimeSocial;

  set alltimeSocial(int alltimeSocial) => _alltimeSocial = alltimeSocial;

  int get aylikPuan => _aylikPuan;

  set aylikPuan(int aylikPuan) => _aylikPuan = aylikPuan;

  int get alltimePuan => _alltimePuan;

  set alltimePuan(int alltimePuan) => _alltimePuan = alltimePuan;

  void aylikpuanAlgorithm(User birey) {
    birey.aylikPuan = 3 * birey.aylikLectureCompletion +
        2 * birey.aylikStreak +
        10 * birey.aylikSocial;
  }

  void alltimepuanAlgorithm(User birey) {
    birey.alltimePuan = 2 * birey.alltimeLectureCompletion +
        3 * birey.alltimeStreak +
        10 * birey.alltimeSocial;
  }

  void printUseraylikPuan(List<User> users) {
    for (var user in users) {
      print('${user.username}: ${user.aylikPuan}');
    }
  }
}

class LeaderboardPage extends StatefulWidget {
  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  @override
  void initState() {
    super.initState();
    sortUsersByAylikPuan(users);
  }


  User Ahmet = User("Ahmet A.", 10, 5, 17, 100, 51, 240, 125, 1553);
  User Selami = User("Selami D.", 16, 8, 5, 116, 60, 114, 89, 982);
  User Huseyin = User("Hüseyin A.", 14, 6, 20, 114, 53, 280, 154, 1787);

  User Renan = User("Renan D.", 6, 2, 45, 96, 38, 250, 247, 1556);

  User Cemre = User("Cemre İ.", 20, 10, 4, 120, 74, 83, 100, 877);

  User Pelin = User("Pelin E.", 8, 3, 4, 80, 40, 60, 125, 580);

  User Ayse = User("Ayşe Z.", 12, 7, 10, 120, 60, 90, 50, 1200);

  User Fatma = User("Fatma Ş.", 6, 2, 2, 60, 30, 45, 32, 435);

  User Ali = User("Ali A.", 15, 9, 12, 150, 75, 110, 123, 1075);

  User Veli = User("Veli R.", 4, 1, 1, 40, 20, 30, 19, 290);

  User Mert = User("Mert H.", 20, 12, 15, 200, 100, 150, 159, 1450);


  late final List<User> users = [
    Ahmet,
    Pelin,
    Ayse,
    Fatma,
    Ali,
    Veli,
    Mert,
    Selami,
    Huseyin,
    Renan,
    Cemre
  ];

  // users.sort((a, b) => b.alltimepuanAlgorithm.compareTo(a.aylikPuan));
  bool isAllTimeSelected = false;

  void sortUsersByAylikPuan(List<User> users) {
    users.sort((a, b) => b.aylikPuan.compareTo(a.aylikPuan));
  }

  void sortUsersByAlltimePuan(List<User> users) {
    users.sort((a, b) => b.alltimePuan.compareTo(a.alltimePuan));
  }

  @override
  Widget build(BuildContext context) {
    int cemreIndex = users.indexWhere((user) => user.username == "Cemre İ.");
    GlobalKey cemreKey = GlobalKey();
    ScrollController _scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('🏆 Liderlik Tablosu 🏆'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Aylık',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    value: isAllTimeSelected,
                    onChanged: (value) {
                      value
                          ? sortUsersByAlltimePuan(users)
                          : sortUsersByAylikPuan(users);
                      setState(() {
                        isAllTimeSelected = value;
                      });
                    },
                    activeColor: Colors.blue,
                    inactiveThumbColor: Colors.blue,
                    activeTrackColor: Colors.red,
                    inactiveTrackColor: Colors.green,
                  ),
                  const Text(
                    'Tüm Zamanlar',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Divider(
                color: Colors.grey,
                thickness: 4,
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      key: index == cemreIndex ? cemreKey : null,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(8),
                        child: ExpansionTile(
                          tilePadding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: index % 2 == 0
                              ? Colors.white
                              : Colors.grey.shade200,
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            child: Text(users[index].username[0].toUpperCase()),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                users[index].username,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    isAllTimeSelected
                                        ? '${users[index].alltimePuan}'
                                        : '${users[index].aylikPuan}',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.play_circle),
                                      Text(
                                        isAllTimeSelected
                                            ? '${users[index].alltimeLectureCompletion}'
                                            : '${users[index].aylikLectureCompletion}',
                                      ),
                                      const Text('Ders Tamamlama'),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.local_fire_department),
                                      Text(
                                        isAllTimeSelected
                                            ? '${users[index].alltimeStreak}'
                                            : '${users[index].aylikStreak}',
                                      ),
                                      const Text('Seriler'),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.people),
                                      Text(
                                        isAllTimeSelected
                                            ? '${users[index].alltimeSocial}'
                                            : '${users[index].aylikSocial}',
                                      ),
                                      const Text('Topluluk Etkileşimi'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                    child: Text(Huseyin.username[0].toUpperCase()),
                  ),
                  Text(
                    Huseyin.username,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        isAllTimeSelected
                            ? '${Huseyin.alltimePuan}'
                            : '${Huseyin.aylikPuan}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
