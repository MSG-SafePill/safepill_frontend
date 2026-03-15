import 'package:flutter/material.dart';
import 'home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              
              // [상단 타이틀]
              const Text('Welcome!', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black)),
              const SizedBox(height: 50),

              // [이메일 입력 폼]
              _buildTextField('Email Address', false),
              const SizedBox(height: 15),

              // [비밀번호 입력 폼]
              _buildTextField('Password', true),
              const SizedBox(height: 15),

              // [비밀번호 찾기 링크]
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot password?', style: TextStyle(color: Color(0xFF2A8DE5), fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),

              // [메인 로그인 버튼]
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // 로그인 성공 시 홈 화면으로 이동 (스택 교체)
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2A8DE5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 0,
                  ),
                  child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),

              // [회원가입 유도 링크]
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Not a member? ', style: TextStyle(color: Colors.grey)),
                  GestureDetector(
                    onTap: () {},
                    child: const Text('Register now', style: TextStyle(color: Color(0xFF2A8DE5), fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // [소셜 간편 로그인 영역]
              const Text('Or continue with', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton('G', const Color(0xFFEA4335)),
                  const SizedBox(width: 20),
                  _buildSocialButton('', Colors.black),
                  const SizedBox(width: 20),
                  _buildSocialButton('f', const Color(0xFF1877F2)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // --- [UI 재사용 컴포넌트들] ---

  // 텍스트 입력창 생성 위젯
  Widget _buildTextField(String hint, bool isPassword) {
    return TextField(
      obscureText: isPassword, // 비밀번호일 경우 마스킹 처리
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF8F9FA),
        suffixIcon: isPassword ? const Icon(Icons.visibility_off, color: Colors.grey) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      ),
    );
  }

  // 소셜 로그인 원형 버튼 생성 위젯
  Widget _buildSocialButton(String label, Color color) {
    return Container(
      width: 50, height: 50,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Center(
        child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold))
      ),
    );
  }
}