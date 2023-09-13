import 'package:animal_hospital/data/data_source/post_api/send_verification_email_api.dart';
import 'package:animal_hospital/presentation/components/custom_showbottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailSignUpScreen extends StatefulWidget {
  const EmailSignUpScreen({Key? key}) : super(key: key);

  @override
  State<EmailSignUpScreen> createState() => _EmailSignUpScreen();
}

class _EmailSignUpScreen extends State<EmailSignUpScreen> {
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  final SendVerificationEmail sendEmailPost = SendVerificationEmail();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController(); // 비밀번호 입력값 관리를 위한 컨트롤러 추가


  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      setState(() {});
    });
    _passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 가로 회전 안되게 하는 코드
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Text(
              '간편히 가입하고',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF000000),
              ),
            ),
            Text(
              '다양한 서비스를 이용하세요',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF000000),
              ),
            ),
            SizedBox(height: 45),
            Container(
              width: 320,
              child: TextField(
                focusNode: _emailFocusNode,
                decoration: InputDecoration(
                  //hintText: '이메일 주소',
                  // 텍스트 필드 안에 나타날 placeholder 텍스트
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF323232),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () async {
                    //  bool isEmailVerified = await sendEmailPost.sendEmail(_emailController);
                      showReusableModalBottomSheet(
                        context: context,
                        child: CustomBottomSheet(
                          title: '입력한 이메일 주소로',
                          content: '인증 메일이 발송 되었습니다.',
                          onButtonPressed: () {
                            Navigator.pop(context);
                            print('이메일 아이콘 눌림');
                          },
                          buttonContent: '확인',
                        ),
                      );
                    },
                    child: Icon(Icons.email_outlined, color: Color(0xFF323232)),
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
                    color: _emailFocusNode.hasFocus
                        ? Color(0xFF43D9C0)
                        : Color(0xFF323232),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 320,
              child: TextField(
                focusNode: _passwordFocusNode,
                decoration: InputDecoration(
                  //hintText: '비밀번호',
                  // 텍스트 필드 안에 나타날 placeholder 텍스트
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF323232),
                  ),
                  helperText: '영문, 숫자 포함 8자 이상',
                  // 아래에 나타날 안내 메시지
                  helperStyle: TextStyle(
                    fontSize: 12,
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
                    color: _passwordFocusNode.hasFocus
                        ? Color(0xFF43D9C0)
                        : Color(0xFF323232),
                  ),
                ),
              ),
            ),
            // 간격 조절용
            Spacer(flex: 1),
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
                  '이메일로 회원가입',
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
    home: EmailSignUpScreen(),
  ));
}
