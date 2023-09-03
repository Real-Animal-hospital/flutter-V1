import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Text(
              '간편히 로그인하고',
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
            SizedBox(height: 45),
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
            SizedBox(height: 10),
            Container(
              width: 320,
              child: TextField(
                obscureText: !_showPassword, // 비밀번호 가리기
                decoration: InputDecoration(
                  hintText: '비밀번호',
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    child: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility,
                      color: Color(0xFF323232),
                    ),
                  ),
                  // 텍스트 필드 안에 나타날 placeholder 텍스트
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF3F484A),
                  ),
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
            SizedBox(height: 30), // 추가된 여백
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    // 아이디 비밀번호 찾기 클릭 시 실행할 동작
                  },
                  child: Text(
                    '아이디/비밀번호 찾기',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF414941),
                    ),
                  ),
                ),
                SizedBox(width: 90),
                InkWell(
                  onTap: () {
                    // 이메일로 회원가입 클릭 시 실행할 동작
                  },
                  child: Text(
                    '이메일로 회원가입',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF414941),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              width: 320,
              child: Row(
                // Row로 아이콘들 가로로 배치
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // 구글 로그인 클릭 시 실행할 동작
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage('assets/google_logo.png'), // 이미지 주소 넣기
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 20
                          : 40),
                  // 아이콘 사이 간격 조절
                  InkWell(
                    onTap: () {
                      // 페이스북 로그인 클릭 시 실행할 동작
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage('assets/facebook_logo.png'), // 이미지 주소 넣기
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 20
                          : 40),
                  InkWell(
                    onTap: () {
                      // 구글 로그인 클릭 시 실행할 동작
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage('assets/google_logo.png'), // 이미지 주소 넣기
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
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
                  '로그인',
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
    home: LoginScreen(),
  ));
}
