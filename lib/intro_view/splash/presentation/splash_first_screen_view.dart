 import 'package:animal_hospital/core/router.dart';
import 'package:animal_hospital/intro_view/introduce/presentation/introduce_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashFirstScreen extends StatefulWidget {
  const SplashFirstScreen({super.key});

  @override
  State<SplashFirstScreen> createState() => _SplashFirstScreenState();
}


class _SplashFirstScreenState extends State<SplashFirstScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      router.go('/intro');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF43D9C0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Image.asset(
              'assets/logo_icon/독닥_아이콘_231011(2)1.png', // ll.png 이미지
            ),
            const SizedBox(height: 5.0),
            Image.asset(
              'assets/logo_icon/독닥_로고_흰색_231115.png',
              width: 200.0,
              height: 50.0,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SplashFirstScreen(),
  ));
}
