import 'package:flutter/material.dart';

class EmailSignUpScreen extends StatefulWidget {
  const EmailSignUpScreen({Key? key}) : super(key: key);

  @override
  State<EmailSignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<EmailSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '간편히 가입하고',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '다양한 서비스를 이용하세요',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: 320,
              child: TextField(
                decoration: InputDecoration(
                  hintText: '이메일 주소',
                  // 텍스트 필드 안에 나타날 placeholder 텍스트
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF3F484A),
                  ),
                  suffixIcon:
                      Icon(Icons.email_outlined, color: Color(0xFF3F484A)),
                  // 오른쪽에 아이콘 추가
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: Color(0xFF3F484A),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: 320,
              child: TextField(
                decoration: InputDecoration(
                  hintText: '비밀번호',
                  // 텍스트 필드 안에 나타날 placeholder 텍스트
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF3F484A),
                  ),
                  helperText: '영문, 숫자 포함 8자 이상',
                  // 아래에 나타날 안내 메시지
                  helperStyle: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF3F484A),
                  ),
                  // 오른쪽에 아이콘 추가
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: Color(0xFF3F484A),
                    ),
                  ),
                ),
              ),
            ),
            // 간격 조절용 컨테이너
            Container(
              height: 100.0,
              width: 100.0,
            ),
            Container(
              width: 280,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: Colors.blueAccent),
                color: Color(0xFF608BFF),
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
                  '이메일로 회원가입',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: EmailSignUpScreen(),
  ));
}
