import 'package:flutter/material.dart';

class User {
  String _username;
  int _weeklyLectureCompletion;
  int _weeklyStreak;
  int _weeklySocial;
  int _alltimeLectureCompletion;
  int _alltimeStreak;
  int _alltimeSocial;
  late int _weeklyPuan;
  late int _alltimePuan;

  User(this._username,
      this._weeklyLectureCompletion,
      this._weeklyStreak,
      this._weeklySocial,
      this._alltimeLectureCompletion,
      this._alltimeStreak,
      this._alltimeSocial,
      this._weeklyPuan,
      this._alltimePuan);

  User.initialize(this._username, this._weeklyLectureCompletion,
      this._weeklyStreak, this._weeklySocial, this._alltimeLectureCompletion,
      this._alltimeStreak, this._alltimeSocial);

  String get username => _username;

  set username(String username) => _username = username;

  int get weeklyLectureCompletion => _weeklyLectureCompletion;

  set weeklyLectureCompletion(int weeklyLectureCompletion) =>
      _weeklyLectureCompletion = weeklyLectureCompletion;

  int get weeklyStreak => _weeklyStreak;

  set weeklyStreak(int weeklyStreak) => _weeklyStreak = weeklyStreak;

  int get weeklySocial => _weeklySocial;

  set weeklySocial(int weeklySocial) => _weeklySocial = weeklySocial;

  int get alltimeLectureCompletion => _alltimeLectureCompletion;

  set alltimeLectureCompletion(int alltimeLectureCompletion) =>
      _alltimeLectureCompletion = alltimeLectureCompletion;

  int get alltimeStreak => _alltimeStreak;

  set alltimeStreak(int alltimeStreak) => _alltimeStreak = alltimeStreak;

  int get alltimeSocial => _alltimeSocial;

  set alltimeSocial(int alltimeSocial) => _alltimeSocial = alltimeSocial;

  int get weeklyPuan => _weeklyPuan;

  set weeklyPuan(int weeklyPuan) => _weeklyPuan = weeklyPuan;

  int get alltimePuan => _alltimePuan;

  set alltimePuan(int alltimePuan) => _alltimePuan = alltimePuan;

  void weeklypuanAlgorithm(User birey) {
    birey.weeklyPuan =
        3 * birey.weeklyLectureCompletion + 2 * birey.weeklyStreak +
            10 * birey.weeklySocial;
  }

  void alltimepuanAlgorithm(User birey) {
    birey.alltimePuan =
        2 * birey.alltimeLectureCompletion + 3 * birey.alltimeStreak +
            11 * birey.alltimeSocial;
  }

  void printUserWeeklyPuan(List<User> users) {
    for (var user in users) {
      print('${user.username}: ${user.weeklyPuan}');
    }
//   void sortUsersByWeeklyPuan(User birey) {
//     birey.sort((a, b) => b.weeklyPuan.compareTo(a.weeklyPuan));
//   }
//
//   void sort(Function(dynamic a, dynamic b) param0) {}
// //
// void sortAlg(User birey){
//   birey.alltimePuan= 2*birey._alltimeLectureCompletion+ 3*birey._alltimeStreak+ 11*birey._alltimeSocial;
//
// }
  }

}

class LeaderboardPage extends StatefulWidget {

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  User Ahmet = User(
      "Ahmet",
      10,
      5,
      7,
      100,
      50,
      70,
      150,
      1000);

  User Mehmet = User(
      "Mehmet",
      8,
      3,
      4,
      80,
      40,
      60,
      120,
      800);

  User Ayse = User(
      "Ayşe",
      12,
      7,
      10,
      120,
      60,
      90,
      180,
      1200);

  User Fatma = User(
      "Fatma",
      6,
      2,
      2,
      60,
      30,
      45,
      90,
      600);

  User Ali = User(
      "Ali",
      15,
      9,
      12,
      150,
      75,
      110,
      225,
      1500);

  User Veli = User(
      "Veli",
      4,
      1,
      1,
      40,
      20,
      30,
      60,
      400);

  User Mert = User(
      "Mert",
      20,
      12,
      15,
      200,
      100,
      150,
      300,
      2000);

  late final List<User> users = [Ahmet, Mehmet, Ayse, Fatma, Ali, Veli, Mert];

  // users.sort((a, b) => b.alltimepuanAlgorithm.compareTo(a.weeklyPuan));
  bool isWeeklySelected = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isWeeklySelected = true;
                  });
                },
                child: Text('Weekly'),
                style: ElevatedButton.styleFrom(
                  primary: isWeeklySelected ? Colors.blue : null,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isWeeklySelected = false;
                  });
                },
                child: Text('All Time'),
                style: ElevatedButton.styleFrom(
                  primary: isWeeklySelected ? null : Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return Material(
                  child: ListTile(
                    title: Text(users[index].username),
                    subtitle: Row(
                      children: [
                        Icon(Icons.check_circle),
                        SizedBox(width: 8.0),
                        Text(
                          isWeeklySelected
                              ? '${users[index].weeklyLectureCompletion}'
                              : '${users[index].alltimeLectureCompletion}',
                        ),
                        SizedBox(width: 16.0),
                        Icon(Icons.local_fire_department_outlined),
                        SizedBox(width: 8.0),
                        Text(
                          isWeeklySelected
                              ? '${users[index].weeklyStreak}'
                              : '${users[index].alltimeStreak}',
                        ),
                        SizedBox(width: 16.0),
                        Icon(Icons.people),
                        SizedBox(width: 8.0),
                        Text(
                          isWeeklySelected
                              ? '${users[index].weeklySocial}'
                              : '${users[index].alltimeSocial}',
                        ),
                        SizedBox(width: 16.0),
                        Icon(Icons.star),
                        SizedBox(width: 8.0),
                        Text(
                          isWeeklySelected
                              ? '${users[index].weeklyPuan}'
                              : '${users[index].alltimePuan}',
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
    );
  }
}


// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Leaderboard'),
//     ),
//     body: Center(
//       child: Align(
//         child: ElevatedButton(
//           child: Text('Giriş Yap'),
//           onPressed: () {
//             //////// UNUTMA
//           },
//         ),
//
//       ),
//     ),
//   );
// }

// @override
// Widget build(BuildContext context) {
//   return CupertinoPageScaffold(
//     backgroundColor: config.Colors().secondColor(1),
//     child: Stack(
//       alignment: Alignment.center,
//       children: <Widget>[
//         SafeArea(
//           child: local
//               ? CustomScrollView(
//             slivers: <Widget>[
//               SliverFixedExtentList(
//                   delegate:
//                   SliverChildListDelegate.fixed([Container()]),
//                   itemExtent:
//                   MediaQuery.of(context).size.height * 0.23),
//               SliverToBoxAdapter(
//                 child: SectionHeader(
//                   text: 'Google Leaderboard',
//                   onPressed: () {},
//                 ),
//               ),
//               SliverToBoxAdapter(
//                 child: Stack(
//                   children: <Widget>[
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: 240,
//                       child: ListView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: 3,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 8.0, horizontal: 14),
//                             child: CardWidget(
//                               gradient: false,
//                               button: false,
//                               child: Row(
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "${index + 1}.",
//                                       style: TextStyle(
//                                           fontFamily: 'Red Hat Display',
//                                           fontSize: 18,
//                                           color: Color(0xFF585858)),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "${names[index]}",
//                                       style: TextStyle(
//                                           fontFamily: 'Red Hat Display',
//                                           fontSize: 18,
//                                           color: Color(0xFF585858)),
//                                     ),
//                                   ),
//                                   Spacer(),
//                                   Container(
//                                     width: MediaQuery.of(context)
//                                         .size
//                                         .width *
//                                         0.3,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.only(
//                                             topLeft: Radius.elliptical(
//                                                 10, 50),
//                                             bottomLeft:
//                                             Radius.elliptical(
//                                                 10, 50)),
//                                         gradient: LinearGradient(
//                                             colors: [
//                                               material.Colors.white,
//                                               colors[index]
//                                             ],
//                                             begin: Alignment.topLeft,
//                                             end:
//                                             Alignment.bottomRight)),
//                                     child: Padding(
//                                       padding:
//                                       const EdgeInsets.all(8.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment
//                                             .spaceEvenly,
//                                         children: <Widget>[
//                                           Image.asset(
//                                             'assets/images/CoinSmall.png',
//                                             width: 50,
//                                           ),
//                                           Text(
//                                             "${coins[index]}",
//                                             style: TextStyle(
//                                                 fontFamily:
//                                                 'Red Hat Display',
//                                                 fontSize: 18,
//                                                 color:
//                                                 Color(0xFF585858)),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               height: 60,
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     Positioned(
//                         top: -5,
//                         left: -4,
//                         child: Image.asset('assets/images/crown.png'))
//                   ],
//                 ),
//               ),
//               SliverToBoxAdapter(
//                 child: SectionHeader(
//                   text: 'My Statistics',
//                   onPressed: () {},
//                 ),
//               ),
//               SliverToBoxAdapter(
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 245,
//                   child: StatsCard(),
//                 ),
//               ),
//             ],
//           )
//               : CustomScrollView(
//             slivers: <Widget>[
//               SliverFixedExtentList(
//                   delegate:
//                   SliverChildListDelegate.fixed([Container()]),
//                   itemExtent:
//                   MediaQuery.of(context).size.height * 0.23),
//               SliverToBoxAdapter(
//                 child: SectionHeader(
//                   text: 'Leaderboard',
//                   onPressed: () {},
//                 ),
//               ),
//               SliverToBoxAdapter(
//                 child: Stack(
//                   children: <Widget>[
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height,
//                       child: ListView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: 10,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 8.0, horizontal: 14),
//                             child: CardWidget(
//                               gradient: false,
//                               button: false,
//                               child: Row(
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "${index + 1}.",
//                                       style: TextStyle(
//                                           fontFamily: 'Red Hat Display',
//                                           fontSize: 18,
//                                           color: Color(0xFF585858)),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "${names[index]}",
//                                       style: TextStyle(
//                                           fontFamily: 'Red Hat Display',
//                                           fontSize: 18,
//                                           color: Color(0xFF585858)),
//                                     ),
//                                   ),
//                                   Spacer(),
//                                   Container(
//                                     width: MediaQuery.of(context)
//                                         .size
//                                         .width *
//                                         0.3,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.only(
//                                             topLeft: Radius.elliptical(
//                                                 10, 50),
//                                             bottomLeft:
//                                             Radius.elliptical(
//                                                 10, 50)),
//                                         gradient: LinearGradient(
//                                             colors: [
//                                               material.Colors.white,
//                                               colors[index]
//                                             ],
//                                             begin: Alignment.topLeft,
//                                             end:
//                                             Alignment.bottomRight)),
//                                     child: Padding(
//                                       padding:
//                                       const EdgeInsets.all(8.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment
//                                             .spaceEvenly,
//                                         children: <Widget>[
//                                           Image.asset(
//                                             'assets/images/CoinSmall.png',
//                                             width: 50,
//                                           ),
//                                           Text(
//                                             "${coins[index]}",
//                                             style: TextStyle(
//                                                 fontFamily:
//                                                 'Red Hat Display',
//                                                 fontSize: 18,
//                                                 color:
//                                                 Color(0xFF585858)),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               height: 60,
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     Positioned(
//                         top: -5,
//                         left: -4,
//                         child: Image.asset('assets/images/crown.png'))
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           top: 0,
//           child: Stack(
//             alignment: Alignment.center,
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   TopBar(
//                     controller: controller,
//                     expanded: false,
//                     onMenuTap: widget.onMenuTap,
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height * 0.07,
//                     color: material.Colors.white,
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           CupertinoButton(
//                             onPressed: () {
//                               setState(() {
//                                 local = true;
//                               });
//                             },
//                             child: Text(
//                               "Local",
//                               style: TextStyle(
//                                   color: Color(0xFF343434),
//                                   fontSize: 20,
//                                   fontFamily: 'Red Hat Display',
//                                   fontWeight: material.FontWeight.w600),
//                             ),
//                           ),
//                           CupertinoButton(
//                             onPressed: () {
//                               setState(() {
//                                 local = false;
//                               });
//                             },
//                             child: Text(
//                               "Global",
//                               style: TextStyle(
//                                   color: Color(0xFF343434),
//                                   fontSize: 20,
//                                   fontFamily: 'Red Hat Display',
//                                   fontWeight: material.FontWeight.w600),
//                             ),
//                           )
//                         ]),
//                   )
//                 ],
//               ),
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 child: AnimatedContainer(
//                   margin: local
//                       ? EdgeInsets.only(
//                       left: MediaQuery.of(context).size.width * 0.33 - 35)
//                       : EdgeInsets.only(
//                       left:
//                       MediaQuery.of(context).size.width * 0.67 - 10),
//                   width: 40,
//                   height: 4,
//                   duration: Duration(milliseconds: 300),
//                   decoration: BoxDecoration(
//                       color: Color(0xFF03A9F4),
//                       borderRadius: BorderRadius.circular(500)),
//                 ),
//               )
//             ],
//           ),
//         )
//       ],
//     ),
//   );
// }
// }

