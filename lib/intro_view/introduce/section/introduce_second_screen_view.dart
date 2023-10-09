import 'package:flutter/material.dart';

class IntroduceSecondScreen extends StatelessWidget {
  const IntroduceSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 450.0, left: 40.0), // 이 부분을 조절하여 텍스트의 위치를 내릴 수 있습니다.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "다른 여러 증상도",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              "병원을 추천해주니",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              "걱정마세요!",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
