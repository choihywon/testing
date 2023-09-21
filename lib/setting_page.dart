import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'auth_service.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'main.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController jobController = TextEditingController();

  bool _isChecked1 = false; //카메라 on/off
  bool _isChecked2 = false; //푸쉬알림 on/off
  int _cntTop = 0;
  int _cntUnder = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 232, 232),
      appBar: AppBar(
        title: Text(
          "c-clinic",
          style: TextStyle(fontSize: 38, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 15.0,
        backgroundColor: clinic_color,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(25, 60, 0, 0),
              child: Text(
                "환경설정",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            // 카메라
            Container(
                height: 80,
                margin: EdgeInsets.fromLTRB(25, 25, 25, 7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      //camera image
                      padding: const EdgeInsets.only(left: 40, right: 10),
                      child: Image.asset(
                        'assets/images/camera.png',
                        width: 22,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      '카메라',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 160, right: 20),
                      child: Text(
                        'off',
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    //on_off_button
                    Switch(
                      value: _isChecked1,
                      onChanged: (value) {
                        setState(() {
                          _isChecked1 = value;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'on',
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                )),
            // 각도조절
            Container(
                height: 130,
                margin: EdgeInsets.fromLTRB(25, 7, 25, 7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 40, right: 10),
                    //   child: Image.asset(
                    //     'assets/images/angle.png',
                    //     width: 22,
                    //     height: 20,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    Text(
                      '각도 조절',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(160, 25, 0, 0),
                      child: Column(
                        children: [
                          Row(
                            //윗 지지대
                            children: [
                              SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: FittedBox(
                                    child: FloatingActionButton(
                                      onPressed: () async {
                                      final DatabaseReference _realtimeDatabase = FirebaseDatabase.instance.ref();
                                      try {
                                          await _realtimeDatabase.child('top_angle').set(_cntTop);
                                           print('angle 값으로 $_cntTop 을 Firebase에 보냈습니다.');
                                          // Firebase 작업 완료 후에 setState를 호출하여 UI를 업데이트
                                          setState(() {
                                              _cntTop = _cntTop + 15;
                                          });
                                        } catch (error) {
                                             print('Firebase 업데이트 중 오류 발생: $error');
                                        }
                                    }, //버튼 누르면 cnt++
                                      backgroundColor:
                                          Color.fromARGB(255, 148, 148, 148),
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        size: 50,
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                //윗 지지대 각도
                                width: 50,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    '$_cntTop',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: FittedBox(
                                    child: FloatingActionButton(
                                     onPressed: () async {
                                      final DatabaseReference _realtimeDatabase = FirebaseDatabase.instance.ref();
                                      try {
                                          await _realtimeDatabase.child('top_angle').set(_cntTop);
                                           print('angle 값으로 $_cntTop 을 Firebase에 보냈습니다.');
                                          // Firebase 작업 완료 후에 setState를 호출하여 UI를 업데이트
                                          setState(() {
                                              _cntTop = _cntTop - 15;
                                          });
                                        } catch (error) {
                                             print('Firebase 업데이트 중 오류 발생: $error');
                                        }
                                    },//버튼 누르면 cnt--
                                      backgroundColor:
                                          Color.fromARGB(255, 148, 148, 148),
                                      child: Icon(
                                        Icons.remove_circle_outline,
                                        size: 50,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            //아래 지지대
                            children: [
                              SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: FittedBox(
                                    child: FloatingActionButton(
                                      onPressed: () async {
                                        final DatabaseReference _realtime_Database = FirebaseDatabase.instance.ref();
                                        try {
                                          await _realtime_Database.child('under_angle').set(_cntUnder);
                                           print('angle 값으로 $_cntUnder 을 Firebase에 보냈습니다.');
                                          // Firebase 작업 완료 후에 setState를 호출하여 UI를 업데이트
                                          setState(() {
                                              _cntUnder = _cntUnder + 15;
                                          });
                                        } catch (error) {
                                             print('Firebase 업데이트 중 오류 발생: $error');
                                        }
                                      }, //버튼 누르면 cnt++
                                      backgroundColor:
                                          Color.fromARGB(255, 148, 148, 148),
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        size: 50,
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                //아래 지지대 각도
                                width: 50,
                                child: Center(
                                  child: Text(
                                    '$_cntUnder',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: FittedBox(
                                    child: FloatingActionButton(
                                      onPressed: () async {
                                         final DatabaseReference _realtime__Database = FirebaseDatabase.instance.ref();
                                        try {
                                          await _realtime__Database.child('under_angle').set(_cntUnder);
                                           print('angle 값으로 $_cntUnder 을 Firebase에 보냈습니다.');
                                          // Firebase 작업 완료 후에 setState를 호출하여 UI를 업데이트
                                          setState(() {
                                              _cntUnder = _cntUnder - 15;
                                          });
                                        } catch (error) {
                                             print('Firebase 업데이트 중 오류 발생: $error');
                                        }
                                      }, //버튼 누르면 cnt--
                                      backgroundColor:
                                          Color.fromARGB(255, 148, 148, 148),
                                      child: Icon(
                                        Icons.remove_circle_outline,
                                        size: 50,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            // 알림설정
            Container(
                height: 90,
                margin: EdgeInsets.fromLTRB(25, 7, 25, 7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 10),
                      child: Image.asset(
                        'assets/images/push.png',
                        width: 22,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      '알림 설정',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 150, right: 20),
                      child: Text(
                        'off',
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    //on_off_button
                    Switch(
                      value: _isChecked2,
                      onChanged: (value) {
                        setState(() {
                          _isChecked2 = value;

                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'on',
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: TextButton(
                child: Text(
                  "로그아웃",
                  textAlign: TextAlign.left, // 왼쪽 정렬
                ),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 12,
                  ),
                  foregroundColor: clinic_color,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}