import 'package:flutter/material.dart';

class SignUpDoneScreen extends StatefulWidget {
  const SignUpDoneScreen({Key? key}) : super(key: key);

  @override
  State<SignUpDoneScreen> createState() => _SignUpDoneScreen();
}

class _SignUpDoneScreen extends State<SignUpDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Text(
              '가입이 완료되었습니다!!',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Color(0xFF000000),
              ),
            ),
            SizedBox(height: 35),
            Container(
              width: 280,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: Color(0xFF43D9C0)),
                color: Color(0xFF43D9C0),
              ),
              child: ElevatedButton(
                onPressed: () {
                  // 회원가입 버튼이 눌렸을 때 실행할 동작
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, // 배경색을 투명하게 설정
                  elevation: 0, // 그림자 효과 없애기
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  '독닥 시작하기',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
                child: SizedBox(
              height: 50,
            )),
            Container(
                child: Text(
              "@2023 Dogdoc All copyrights reserved",
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w400, // 오타 수정
              ),
            )),
            Expanded(
                child: SizedBox(
              height: 30,
            )),
            Container(),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SignUpDoneScreen(),
  ));
}
