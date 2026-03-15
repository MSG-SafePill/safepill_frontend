import 'package:flutter/material.dart';
import 'dart:async'; // 타이머를 쓰기 위한 패키지
import 'login.dart'; // 이동할 로그인 화면

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 마법의 코드: 화면이 켜지고 2초 뒤에 로그인 화면으로 스르륵 넘어갑니다!
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement( // pushReplacement는 뒤로 가기 버튼을 없애줍니다.
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        // 두 번째 사진 느낌의 파란색~초록색 예쁜 그라데이션 배경
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF2A8DE5), Color(0xFF00E676)], 
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 임시 로고 아이콘 (나중에 진짜 이미지로 바꾸면 됩니다)
            Icon(Icons.medication, size: 80, color: Colors.white),
            SizedBox(height: 20),
            Text(
              'SafePill',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.5),
            ),
            SizedBox(height: 10),
            Text(
              '안전한 복용의 시작',
              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}