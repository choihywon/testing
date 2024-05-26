import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'main.dart';

/// 로그인 페이지
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(60, 100, 60, 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// 현재 유저 로그인 상태
            Center(
              child: Text(
                "C - Clinic",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: clinic_color,
                ),
              ),
            ),
            SizedBox(height: 64),

            /// 로그인 text
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                "로그인",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            /// 이메일
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    labelText: "아이디",
                    hintText: "이메일을 입력하세요."),
              ),
            ),

            /// 비밀번호
            TextFormField(
              controller: passwordController,
              obscureText: true, // 비밀번호 안보이게
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  labelText: "비밀번호",
                  hintText: "비밀번호를 입력하세요."),
            ),
            //SizedBox(height: 32),

            /// 로그인 버튼
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  child: Text("로그인", style: TextStyle(fontSize: 15)),
                  onPressed: () {
                    // 로그인 성공시 HomePage로 이동
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: clinic_color),
                ),
              ),
            ),

            /// 회원가입 버튼
            SizedBox(
              height: 40,
              child: ElevatedButton(
                child: Text(
                  "회원가입",
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  // 회원가입
                  print("sign up");
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: clinic_color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}