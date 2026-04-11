import 'package:flutter/material.dart';
// 1. 띄우고 싶은 화면의 파일을 import 합니다.
import 'screens/landing.dart'; 
import 'screens/home.dart';   

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafePill',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2A8DE5)),
        useMaterial3: true,
      ),
      
      // 👉 2. 앱을 켰을 때 처음 보일 화면(클래스명)을 적어줍니다!
      home: const LandingScreen(), // 랜딩 화면으로 시작하고 싶을 때
      // home: const HomeScreen(), // 홈 화면으로 시작하고 싶을 때
      
      debugShowCheckedModeBanner: false,
    );
  }
}