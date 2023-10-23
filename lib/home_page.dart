
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';
import 'main.dart';
import 'setting_page.dart';
import 'week_page.dart';
import 'today_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController jobController = TextEditingController();

  bool isOn = false;
  String _str = '';

  Future<void> _onPressed(BuildContext context) async {
    if (isOn == true) {
      _str = '카메라가 켜졌어요!';
       final DatabaseReference _realtimeDatabase = FirebaseDatabase.instance.ref();

    try {
      // 'switch' 변수에 1을 업데이트
      await _realtimeDatabase.child('switch').set(1);
    } catch (error) {
      print('Firebase 업데이트 중 오류 발생: $error'); //catch를 하면 firebase 느리게 받아오는 오류 발생 수정필요
    }

    } else if (isOn == false) {
      _str = '카메라가 꺼졌어요!';
      final DatabaseReference _realtimeDatabase = FirebaseDatabase.instance.ref();

       try {
      // 'switch' 변수에 1을 업데이트
      await _realtimeDatabase.child('switch').set(0);
      } catch (error) {
        print('Firebase 업데이트 중 오류 발생: $error');
      }
    }

    var snackBar = SnackBar(
      content: Text(
        '$_str',
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      width: 150,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "c-clinic",
          style: TextStyle(fontSize: 38, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 20.0,
        backgroundColor: clinic_color,
        actions: [
          TextButton(
            child: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              //print("sign out");
              // 환경설정페이지로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            IconButton(
                //today
                iconSize: 120.0,
                onPressed: () {
                  initState();

                  isOn = !isOn; //toggle
                  _onPressed(context);
                },
                icon: Image.asset(
                  'assets/images/rogo.png',
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                '고부기를 눌러 카메라 on/off',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 78, 78, 78),
                ),
              ),
            ),
            Container(
              width: 390,
              height: 130,
              margin: EdgeInsets.only(top: 110),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(children: [
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        //today
                        iconSize: 100.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TodayPage()),
                          );
                        },
                        icon: Image.asset(
                          'assets/images/today.png',
                        )),
                    IconButton(
                        //week
                        iconSize: 100.0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WeekPage()),
                          );
                        },
                        icon: Image.asset(
                          'assets/images/week.png',
                        )),
                    IconButton(
                        //chatbot
                        iconSize: 100.0,
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/images/chatbot.png',
                        )),
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}

// class Loading extends StatefulWidget {
//   const Loading({super.key});

//   @override
//   State<Loading> createState() => _LoadingState();
// }

// class _LoadingState extends State<Loading> with TickerProviderStateMixin {
//   late AnimationController controller;
//   //const Loading({super.key});

//   @override
//   void initState() {
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 10),
//     );
//     controller.repeat(reverse: true);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             Text(
//               '10초',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             CircularProgressIndicator(
//               value: controller.value,
//               //semanticsLabel: 'Circular progress indicator',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
