import 'package:animal_hospital/auth/siginup/data/data_source/get_api/get_email_verification_status.dart';
import 'package:animal_hospital/auth/siginup/data/data_source/post_api/send_verification_email_api.dart';
import 'package:animal_hospital/components/custom_showbottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class EmailSignUpScreen extends StatefulWidget {
  const EmailSignUpScreen({Key? key}) : super(key: key);

  @override
  State<EmailSignUpScreen> createState() => _EmailSignUpScreen();
}

class _EmailSignUpScreen extends State<EmailSignUpScreen> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _isPasswordVisible = false;

  // 입력값 유효성 검사
  bool _isInputValid() {
    return _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }

  // 이메일 유효성 검사
  bool _isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern as String);
    return regex.hasMatch(email);
  }

  final SendVerificationEmail sendEmailPost = SendVerificationEmail();

  final _emailController = TextEditingController();
  final _passwordController =
      TextEditingController(); // 비밀번호 입력값 관리를 위한 컨트롤러 추가

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
            const Spacer(flex: 2),
            const Text(
              '간편히 가입하고',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF000000),
              ),
            ),
            const Text(
              '다양한 서비스를 이용하세요',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF000000),
              ),
            ),
            const SizedBox(height: 45),
            Container(
              width: 320,
              child: TextField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                decoration: InputDecoration(
                  //hintText: '이메일 주소',
                  // 텍스트 필드 안에 나타날 placeholder 텍스트
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF323232),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () async {
                      if (_isInputValid() &&
                          _isEmailValid(_emailController.text)) {
                        await sendEmailPost.sendEmail(
                          _emailController.text,
                          _passwordController.text, // 비밀번호 추가
                        );
                        print('이메일화면에서 보내는 데이터${_emailController.text},'
                            '비밀번호 :'
                            '${_passwordController.text}');
                        showReusableModalBottomSheet(
                          context: context,
                          child: CustomBottomSheet(
                            title: '입력한 이메일 주소로',
                            content: const Text(
                              '인증 메일이 발송 되었습니다.',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            onButtonPressed: () {
                              Navigator.pop(context);
                              print('이메일 아이콘 눌림');
                            },
                            buttonContent: const Text(
                              '확인',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('이메일과 비밀번호를 입력해주세요.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: const Icon(Icons.email_outlined,
                        color: Color(0xFF323232)),
                  ),
                  // 오른쪽에 아이콘 추가
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: Color(0xFF323232),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: Color(0xFF43D9C0),
                    ),
                  ),
                  labelText: '이메일 주소',
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: _emailFocusNode.hasFocus
                        ? const Color(0xFF43D9C0)
                        : const Color(0xFF323232),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 320,
              child: TextField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        // 비밀번호 보이기/감추기 기능
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    child: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: const Color(0xFF323232),
                    ),
                  ),
                  //hintText: '비밀번호',
                  // 텍스트 필드 안에 나타날 placeholder 텍스트
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF323232),
                  ),
                  helperText: '영문, 숫자 포함 8자 이상',
                  // 아래에 나타날 안내 메시지
                  helperStyle: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF323232),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: Color(0xFF323232),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: Color(0xFF43D9C0),
                    ),
                  ),
                  labelText: '비밀번호',
                  labelStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: _passwordFocusNode.hasFocus
                        ? const Color(0xFF43D9C0)
                        : const Color(0xFF323232),
                  ),
                ),
              ),
            ),
            // 간격 조절용
            const Spacer(flex: 1),
            Container(
              width: 280,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: const Color(0xFF43D9C0)),
                color: const Color(0xFF43D9C0),
              ),
              child: ElevatedButton(
                onPressed: () async {
                  // 회원가입 버튼이 눌렸을 때 실행할 동작
                  if (_isInputValid() && _isEmailValid(_emailController.text)) {
                    bool isVerified =
                        await getEmailVerificationStatus(_emailController.text);

                    if (isVerified) {
                      context.push('/signupdone');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('이메일 인증을 완료해주세요.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('이메일과 비밀번호를 입력해주세요.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // 배경색을 투명하게 설정
                  elevation: 0, // 그림자 효과 없애기
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  '이메일로 회원가입',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Expanded(
                child: SizedBox(
              height: 50,
            )),
            Container(
                child: const Text(
              "@2023 Dogdoc All copyrights reserved",
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w400, // 오타 수정
              ),
            )),
            const Expanded(
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
  runApp(const MaterialApp(
    home: EmailSignUpScreen(),
  ));
}
