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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Container(
              width: 148,
              height: 148,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff43d9c0),
              ),
            ),
            const Spacer(flex: 2), // 간격 추가
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: const Divider(
                // 경계선 추가
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "@2023 Dogdoc All copyrights reserved",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(flex: 1),
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
