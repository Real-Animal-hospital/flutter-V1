import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    // 가로 회전이 안되게 하는 코드
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
                 // hintText: '이메일 주소',
                  // 텍스트 필드 안에 나타날 placeholder 텍스트
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF323232),
                  ),
                  // 오른쪽에 아이콘 추가
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: Color(0xFF323232),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: Color(0xFF43D9C0),
                    ),
                  ),
                  labelText: '이메일 주소',
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF323232),
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
                  //hintText: '비밀번호',
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
                    color: Color(0xFF323232),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: Color(0xFF323232),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: Color(0xFF43D9C0),
                    ),
                  ),
                  labelText: '비밀번호',
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF323232),
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
                    context.push('/foundid');
                  },
                  child: Text(
                    '아이디/비밀번호 찾기',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF323232),
                    ),
                  ),
                ),
                SizedBox(width: 90),
                InkWell(
                  onTap: () {
                    context.push('/emailsignup');
                  },
                  child: Text(
                    '이메일로 회원가입',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF323232),
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
                      // 카카오톡 아이콘 클릭 이벤트 처리
                      print('카카오톡 아이콘을 클릭했습니다.');
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/kakao.svg', // 첫 번째 SVG 파일 경로
                          width: 53,
                          height: 53,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 20
                          : 20),
                  // 아이콘 사이 간격 조절
                  InkWell(
                    onTap: () {
                      // 페이스북 아이콘 클릭 이벤트 처리
                      print('페이스북 아이콘을 클릭했습니다.');
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/facebook_back.svg', // 첫 번째 SVG 파일 경로
                          width: 53,
                          height: 53,
                        ),
                        SvgPicture.asset(
                          'assets/facebook_icon.svg', // 두 번째 SVG 파일 경로
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 20
                          : 20),
                  InkWell(
                    onTap: () {
                      // 구글 아이콘 클릭 이벤트 처리
                      print('구글 아이콘을 클릭했습니다.');
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/google_back.svg', // 첫 번째 SVG 파일 경로
                          width: 53,
                          height: 53,
                        ),
                        SvgPicture.asset(
                          'assets/google_icon.svg', // 두 번째 SVG 파일 경로
                          width: 27,
                          height: 27,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
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
                  // 다음으로 넘어가기 버튼을 눌렀을 때 실행할 동작

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // 배경색을 투명하게 설정
                  elevation: 0, // 그림자 효과 없애기
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  '다음으로 넘어가기',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
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
