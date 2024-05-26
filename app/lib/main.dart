import 'dart:convert';
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'auth_service.dart';
import 'login_page.dart';


const clinic_color = Color.fromARGB(255, 41, 75, 43);
int count = 0;
List<int> myArray_today = List<int>.filled(300, 0);


var hours = List.empty(growable: true);
var minutes = List.empty(growable: true);
var month = List.empty(growable: true);
var day = List.empty(growable: true);
var test = List.empty(growable:true);

List<String> allDates = [];
List<String> formattedDates = [];
Map<String, int> warningCounts = {};


int cntTop = 0;
int cntUnder = 0;
int camera = 0;

int warning = 0;

int day_s = 0;
int hour_s = 0;
int minute_s = 0;
int month_s = 0;
int second_s = 0;
int camera_swich = 0;
int camera_s = 0;

int warningCount = 0;
 List<int> warningCountsByMonth = List.filled(12, 0);
List<String> monthLabels = [];
List<int> dayOfWeekCount = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  runAppWithRealtimeUpdates();
}

void runAppWithRealtimeUpdates() async {
  await realtime();
}




Future<void> realtime() async {
  FirebaseDatabase _realtime = FirebaseDatabase.instance;

  List<int> countQueue = [];
  int queueSize = 7;


  // Listen for real-time updates on "time"
  _realtime.ref().child("time").onValue.listen((event) {
    DataSnapshot snapshot = event.snapshot;
    Map<dynamic, dynamic> _value = snapshot.value as Map<dynamic, dynamic>;

    day_s = _value["day"] as int;
    hour_s = _value["hour"] as int;
    minute_s = _value["minute"] as int;
    month_s = _value["month"] as int;
    second_s = _value["second"] as int;

    hours.add(hour_s);
    minutes.add(minute_s);
    month.add(month_s);
    day.add(day_s);
    
    DateTime now = DateTime.now();

    print("Day: $day_s");
    print("Hour: $hour_s");
    print("Minute: $minute_s");
    print("Month: $month_s");
    print("Second: $second_s");
    
    String formattedDate = '${month_s}/${day_s}';
    DateTime date = DateTime(now.year, month_s, day_s); // 받아온 월과 일로 DateTime 객체를 생성합니다


    allDates.add(formattedDate);
    
   if (allDates.length > queueSize) {
      allDates.removeAt(0);
    }

    // 모든 날짜 목록을 출력합니다
    print("모든 날짜: $allDates");

    warningCount++;


  });

  // Listen for real-time updates on "warning"
 


  // Listen for real-time updates on "angle"
  _realtime.ref().child("angle").onValue.listen((event) {
    DataSnapshot snapshot = event.snapshot;
    Map<dynamic, dynamic> value = snapshot.value as Map<dynamic, dynamic>;

    cntTop = value["Top"] as int;
    cntUnder = value["Under"] as int;

    print("Top: $cntTop");
    print("Under: $cntUnder");
  });


  await _realtime.ref().child("camera").set({
    "camera": camera,
  }); //warning 안에 warning 있음

  
  await _realtime.ref().child("warning").set({
    "warning": warning,
  }); //warning 안에 warning 있음



}



// List<double> convertedData_cnt = formattedDatesQueue.map((date) {
//   // 여기에서 날짜를 일 수로 변환하는 작업을 수행합니다.
//   // 예를 들어, 날짜를 1부터 시작하는 일 수로 변환할 수 있습니다.
//   return formattedDatesQueue.indexOf(date) + 1.0;
// }).toList();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

 

  // void _listenForWarningChanges() {
  //   DatabaseReference _warningRef =
  //       FirebaseDatabase.instance.ref('/warning/warning');
  //   //FirebaseDatabase.instance.ref().child("warning");
  //   _warningRef.onValue.listen((DatabaseEvent event) {
  //     int warningValue = event.snapshot.value as int;
  //     print("warning값 확인 :");
  //     print(warningValue);
  //     if (warningValue == 1) {
  //       _sendPushNotification();
  //     }
  //   });
  // }

  // Future<void> _sendPushNotification() async {
  //   try {
  //     /* RemoteMessage notificationMessage = RemoteMessage(
  //       data: {
  //         'title': '경고 알림',
  //         'body': '자세를 고치세요!',
  //       },
  //     ); */
  //     final AndroidNotificationDetails androidPlatformChannelSpecifics =
  //         AndroidNotificationDetails(
  //       'your channel id',
  //       'your channel name',
  //       //'your channel description',
  //       importance: Importance.max,
  //       priority: Priority.high,
  //     );

  //     final NotificationDetails platformChannelSpecifics =
  //         NotificationDetails(android: androidPlatformChannelSpecifics);
  //     await _flutterLocalNotificationsPlugin.show(
  //       0, // 알림 ID
  //       '경고', // 알림 제목
  //       '자세를 고치세요!', // 알림 내용
  //       platformChannelSpecifics,
  //       payload: 'custom_notification',
  //     );
  //     //await FirebaseMessagg.instance._showNotification(notificationMessage);
  //     //_showNotification(notificationMessage);
  //     //await FirebaseMessaging.instance.(notificationMessage);
  //     print('푸시 알림이 성공적으로 전송되었습니다.');
  //   } catch (e) {
  //     print('푸시 알림 전송 중 오류가 발생했습니다: $e');
  //   }
  // } 