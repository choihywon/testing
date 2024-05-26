
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'auth_service.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'main.dart';

class WeekPage extends StatefulWidget {
  const WeekPage({Key? key}) : super(key: key);

  @override
  State<WeekPage> createState() => _WeekPageState();
}

class _WeekPageState extends State<WeekPage> {
  TextEditingController jobController = TextEditingController();

  int mean = 15;
  int min = 10;
  int max = 20;

  @override
  Widget build(BuildContext context) {
    List<double> w_cnt = [20, 17, 28, 30, 45, 68, 10]; //일별 카운트 리스트
    List<String> w_day = [
      '7/05',
      '7/11',
      '7/12',
      '7/13',
      '7/14',
      '7/15',
      '7/16'
    ]; //날짜 카운트 리스트

    return Scaffold(
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
              padding: EdgeInsets.fromLTRB(30, 50, 0, 0),
              child: Text(
                "주간의 경고",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: CustomPaint(
                  size: Size(400, 100),
                  foregroundPainter: BarChart(
                    data: w_cnt, //count
                    labels: allDates,  //날짜
                    color: Color.fromARGB(255, 155, 155, 155),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 30, 50, 20),
              child: Container(height: 1.0, width: 400, color: Colors.grey),
            ),
            /* 평균 경고횟수 */
            Center(
              child: Container(
                width: 350,
                height: 100,
                //margin: EdgeInsets.only(top: 110),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Row(
                      children: [
                        Text(
                          '평균',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color.fromARGB(255, 138, 193, 235)),
                        ),
                        Text(
                          ' 경고 횟수',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 150, top: 5),
                    child: Row(
                      children: [
                        Text(
                          '$mean',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Text(
                          ' 회',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            /* 최대 경고횟수 */
            Center(
              child: Container(
                width: 350,
                height: 100,
                //margin: EdgeInsets.only(top: 110),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Row(
                      children: [
                        Text(
                          '최대',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color.fromARGB(255, 223, 112, 97)),
                        ),
                        Text(
                          ' 경고 횟수',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 150, top: 5),
                    child: Row(
                      children: [
                        Text(
                          '$max',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Text(
                          ' 회',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            /* 최소 경고횟수 */
            Center(
              child: Container(
                width: 350,
                height: 100,
                //margin: EdgeInsets.only(top: 110),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Row(
                      children: [
                        Text(
                          '최소',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color.fromARGB(255, 102, 211, 88)),
                        ),
                        Text(
                          ' 경고 횟수',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 150, top: 5),
                    child: Row(
                      children: [
                        Text(
                          '$min',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Text(
                          ' 회',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BarChart extends CustomPainter {
  final Color color;
  final List<double> data;
  final List<String> labels;
  double bottomPadding = 0.0;
  double leftPadding = 0.0;
  double textScaleFactorXAxis = 1.0;
  double textScaleFactorYAxis = 1.2;

  BarChart(
      {required this.data,
      required this.labels,
      this.color = const Color.fromARGB(255, 9, 32, 8)});

  @override
  void paint(Canvas canvas, Size size) {
    // 텍스트 공간을 미리 정한다.
    setTextPadding(size);

    List<Offset> coordinates = getCoordinates(size);

    drawBar(canvas, size, coordinates);
    drawXLabels(canvas, size, coordinates);
    drawYLabels(canvas, size, coordinates);
    drawLines(canvas, size, coordinates);
  }

  @override
  bool shouldRepaint(BarChart oldDelegate) {
    return oldDelegate.data != data;
  }

  void setTextPadding(Size size) {
    // 세로 크기의 1/10만큼 텍스트 패딩
    bottomPadding = size.height / 5;
    // 가로 길이 1/10만큼 텍스트 패딩
    leftPadding = size.width / 5;
  }

  void drawBar(Canvas canvas, Size size, List<Offset> coordinates) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    // 막대 그래프가 겹치지 않게 간격을 준다.
    double barWidthMargin = size.width * 0.03;

    for (int index = 0; index < coordinates.length; index++) {
      Offset offset = coordinates[index];
      double left = offset.dx;
      // 간격만큼 가로로 이동
      double right = offset.dx + barWidthMargin;
      double top = offset.dy;
      // 텍스트 크기만큼 패딩을 빼준다. 그래서 텍스트와 겹치지 않게 한다.
      double bottom = size.height - bottomPadding;

      Rect rect = Rect.fromLTRB(left, top, right, bottom);
      canvas.drawRect(rect, paint);
    }
  }

  // x축 텍스트(레이블)를 그린다.
  void drawXLabels(Canvas canvas, Size size, List<Offset> coordinates) {
    // 화면 크기에 따라 유동적으로 폰트 크기를 계산한다.
    // double fontSize = calculateFontSize(labels[0], size, xAxis: true);

    for (int index = 0; index < labels.length; index++) {
      //주간그래프 날짜 적는 곳
      TextSpan span = TextSpan(
        style: TextStyle(
          color: const Color.fromARGB(255, 45, 45, 45),
          fontSize: 15,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w100,
        ),
        text: labels[index],
      );
      TextPainter tp =
          TextPainter(text: span, textDirection: TextDirection.ltr);
      tp.layout();

      Offset offset = coordinates[index];
      double dx = offset.dx;
      double dy = size.height - tp.height;

      tp.paint(canvas, Offset(dx, dy));
    }
  }

  // Y축 텍스트(레이블)를 그린다. 최저값과 최고값을 Y축에 표시한다.
  void drawYLabels(Canvas canvas, Size size, List<Offset> coordinates) {
    double bottomY = coordinates[0].dy;
    double topY = coordinates[0].dy;
    int indexOfMin = 0;
    int indexOfMax = 0;

    for (int index = 0; index < coordinates.length; index++) {
      double dy = coordinates[index].dy;
      if (bottomY < dy) {
        bottomY = dy;
        indexOfMin = index;
      }
      if (topY > dy) {
        topY = dy;
        indexOfMax = index;
      }
    }
    String minValue = '${data[indexOfMin].toInt()}';

    String maxValue = '${data[indexOfMax].toInt()}';

    String middleValue =
        '${(data[indexOfMin].toInt() + data[indexOfMax].toInt()) / 2}';

    double fontSize = 15;

    //double fontSize = calculateFontSize(maxValue, size, xAxis: false);

    drawYText(canvas, minValue, fontSize, bottomY);

    drawYText(canvas, maxValue, fontSize, topY);

    drawYText(canvas, middleValue, fontSize, (topY + bottomY) / 2);
  }

  // 화면 크기에 비례해 폰트 크기를 계산한다.
  double calculateFontSize(String value, Size size, {required bool xAxis}) {
    // 글자수에 따라 폰트 크기를 계산하기 위함
    int numberOfCharacters = value.length;
    // width가 600일 때 100글자를 적어야 한다면, fontSize는 글자 하나당 6이어야 한다.
    double fontSize = (size.width / numberOfCharacters) / data.length;

    if (xAxis) {
      fontSize *= textScaleFactorXAxis;
    } else {
      fontSize *= textScaleFactorYAxis;
    }
    return fontSize;
  }

  // x축 & y축 구분하는 선을 그린다.
  void drawLines(Canvas canvas, Size size, List<Offset> coordinates) {
    Paint paint = Paint()
      ..color = Color.fromARGB(255, 172, 172, 172)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    double bottom = size.height - bottomPadding;
    double left = coordinates[0].dx - 40;

    Path path = Path();
    path.moveTo(left, bottom);
    //path.lineTo(left, bottom);
    path.lineTo(size.width, bottom);

    canvas.drawPath(path, paint);
  }

  void drawYText(Canvas canvas, String text, double fontSize, double y) {
    TextSpan span = TextSpan(
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.black,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w200,
      ),
      text: text,
    );
    TextPainter tp = TextPainter(text: span, textDirection: TextDirection.ltr);

    tp.layout();

    Offset offset = Offset(0.0, y);
    tp.paint(canvas, offset);
  }

  List<Offset> getCoordinates(Size size) {
    List<Offset> coordinates = <Offset>[];

    double maxData = data.reduce(max);

    double width = size.width - leftPadding;
    double minBarWidth = width / data.length;

    for (int index = 0; index < data.length; index++) {
      // 그래프의 가로 위치를 정한다.
      double left = minBarWidth * (index) + leftPadding;
      // 그래프의 높이가 [0~1] 사이가 되도록 정규화 한다.
      double normalized = data[index] / maxData;
      // x축에 표시되는 글자들과 겹치지 않게 높이에서 패딩을 제외한다.
      double height = size.height - bottomPadding;
      // 정규화된 값을 통해 높이를 구한다.
      double top = height - normalized * height;

      Offset offset = Offset(left, top);
      coordinates.add(offset);
    }

    return coordinates;
  }
}