import 'package:flutter/material.dart';
import 'screens/landing.dart';

// [앱 시작점]
void main() {
  runApp(const MyApp());
}

// [최상위 앱 위젯]
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafePill',
      
      // [전역 테마 설정] 앱 전체의 메인 컬러 및 디자인 시스템 적용
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2A8DE5)),
        useMaterial3: true,
      ),
      
      // [첫 화면 (진입점) 설정] 앱을 켜면 랜딩 화면이 뜨도록 지정
      home: const LandingScreen(), 
      
      // 우측 상단의 거슬리는 'DEBUG' 띠 숨김
      debugShowCheckedModeBanner: false,
    );
  }
}