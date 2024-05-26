import 'package:flutter/material.dart';

class MyClass extends StatefulWidget {
  @override
  _MyClassState createState() => _MyClassState();
}


class _MyClassState extends State<MyClass> {
  int number = 0; // 숫자를 저장할 변수

  @override
  void initState() {
    super.initState();
    // 숫자를 읽어오는 작업 등을 수행하고, number 변수 값을 업데이트할 수 있습니다.
    // 예를 들면 사용자 입력이나 API 호출 등이 있을 수 있습니다.
    number = 10; // 임의의 숫자를 설정해보았습니다.
  }

  String getMessage() {
    // 숫자에 따라 메시지를 반환하는 함수
    if (number >= 20) {
      return 'Warn';
    } else if (number >= 10 && number <20) {
      return 'Attention';
    } else if (number < 10) {
      return 'Good';
    } else {
      return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conditional Example'),
      ),
      body: Center(
        child: Text(getMessage()),
      ),
    );
  }
}
// void main() {
//   runApp(MaterialApp(
//     home: MyClass(),
//   ));
// }
