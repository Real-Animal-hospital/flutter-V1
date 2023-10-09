import 'package:flutter/material.dart';

class IntroduceFirstScreen extends StatelessWidget {
  const IntroduceFirstScreen({super.key});

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
              "내 아이의 견종에 따른",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              "유전질환을 추측하고",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              "맞는 병원을 알려드려요",
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
