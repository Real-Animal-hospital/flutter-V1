import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroduceThirdScreen extends StatelessWidget {
  const IntroduceThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 350.0, left: 40.0),
        // 이 부분을 조절하여 텍스트의 위치를 내릴 수 있습니다.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "먼저 아이의 견종을",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              ),
            ),
            const Text(
              "알아야 해요",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "걱정마세요. 먼저 병원",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              ),
            ),
            const Text(
              "부터 찾아도 돼요",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 50),
            Row(
              // 버튼들이 Row의 양쪽 끝에 위치하도록 설정
              children: [
                ElevatedButton(
                  onPressed: () {
                    // 다음에 하기 버튼 눌렀을 때의 동작
                    context.push('/home');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(125, 42), // 버튼의 가로와 세로 크기
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    "다음에 하기",
                    style: TextStyle(
                      color: Color(0XFF3F484A),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 20), // 버튼 사이의 간격 설정 (가로)
                ElevatedButton(
                  onPressed: () {
                    context.push('/login');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 42),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: const Color(0xFF43D9C0),
                  ),
                  child: const Text(
                    "시작하기",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
