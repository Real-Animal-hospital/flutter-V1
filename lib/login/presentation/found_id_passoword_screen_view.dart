import 'package:animal_hospital/components/custom_showbottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FoundIdPassword extends StatefulWidget {
  const FoundIdPassword({super.key});

  @override
  State<FoundIdPassword> createState() => _FoundIdPasswordState();
}

class _FoundIdPasswordState extends State<FoundIdPassword> {
  bool isPasswordRecovery = false; // 비밀번호 찾기인지 아이디 찾기인지 여부
  bool showResetPasswordFields = false; // 비밀번호 재설정 필드를 보여줄지 여부

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _numberFocusNode = FocusNode();
  FocusNode _confirmPasswordFocusNode = FocusNode(); // 비밀번호 재입력

  Color _emailLabelColor = Color(0xFF323232); // 이메일 라벨 색상
  Color _numberLabelColor = Color(0xFF323232); // 휴대폰 번호 라벨 색상
  Color _confirmPasswordLabelColor = Color(0xFF323232); // 비밀번호 재입력 라벨 색상

  final TextEditingController _nameController =
      TextEditingController(); // 이름 입력값 관리를 위한 컨트롤러 추가
  final TextEditingController _numberController =
      TextEditingController(); // 휴대폰 번호 입력값 관리를 위한 컨트롤러 추가
  final TextEditingController _emailController =
      TextEditingController(); // 이메일 입력값 관리를 위한 컨트롤러 추가
  final TextEditingController _newPasswordController =
      TextEditingController(); // 비밀번호 입력 입력값 관리를 위한 컨트롤러 추가
  final TextEditingController _confirmPasswordController =
      TextEditingController(); // 비밀번호 재입력 입력값 관리를 위한 컨트롤러 추가

  TextEditingController determineController() {
    // 이메일인지 이름인지 비밀번호인지에 따라 컨트롤러를 반환하는 함수
    if (showResetPasswordFields) {
      return _newPasswordController;
    }
    return isPasswordRecovery ? _emailController : _nameController;
  }

  String determineLabelText() {
    // 이메일인지 이름인지 비밀번호인지에 따라 라벨 텍스트를 반환하는 함수
    if (showResetPasswordFields) {
      return '비밀번호';
    }
    return isPasswordRecovery ? '이메일 주소를 입력해주세요' : '이름을 입력해주세요';
  }

  final testName = 'test';
  final testNumber = '01012341234';
  final testEmail = 'test1234@naver.com';

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      // 이메일 입력 필드에 포커스가 생기거나 사라질 때마다 라벨 색상을 변경하는 리스너
      setState(() {
        _emailLabelColor =
            _emailFocusNode.hasFocus ? Color(0xFF43D9C0) : Color(0xFF323232);
      });
    });
    _numberFocusNode.addListener(() {
      // 휴대폰 번호 입력 필드에 포커스가 생기거나 사라질 때마다 라벨 색상을 변경하는 리스너
      setState(() {
        _numberLabelColor =
            _numberFocusNode.hasFocus ? Color(0xFF43D9C0) : Color(0xFF323232);
      });
    });
    _confirmPasswordFocusNode.addListener(() {
      // 비밀번호 재입력 필드에 포커스가 생기거나 사라질 때마다 라벨 색상을 변경하는 리스너
      setState(() {
        _confirmPasswordLabelColor = _confirmPasswordFocusNode.hasFocus
            ? Color(0xFF43D9C0)
            : Color(0xFF323232);
      });
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _numberFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 가로 회전 안되게 하는 코드
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("아이디/비밀번호 찾기", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isPasswordRecovery = false;
                        });
                      },
                      child: Text(
                        '메일아이디 찾기',
                        style: TextStyle(
                          color: isPasswordRecovery
                              ? Color(0xFF191C1B)
                              : Color(0xFF43D9C0),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1.50,
                          letterSpacing: 0.50,
                        ),
                      ),
                    ),
                    const SizedBox(width: 100),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isPasswordRecovery = true;
                        });
                      },
                      child: Text(
                        '비밀번호 찾기',
                        style: TextStyle(
                          color: isPasswordRecovery
                              ? Color(0xFF43D9C0)
                              : Color(0xFF191C1B),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1.50,
                          letterSpacing: 0.50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 35),
              width: 320,
              child: Column(
                children: [
                  TextField(
                    focusNode: _emailFocusNode,
                    controller: determineController(),
                    //  isPasswordRecovery ? _emailController : _nameController,
                    decoration: InputDecoration(
                      labelText: determineLabelText(),
                      //    isPasswordRecovery ? '이메일 주소를 입력해주세요' : '이름을 입력해주세요',
                      labelStyle: TextStyle(
                        color: _emailLabelColor,
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF43D9C0)),
                      ),
                    ),
                  ),
                  if (!isPasswordRecovery || showResetPasswordFields) ...[
                    SizedBox(height: 10),
                    TextField(
                      focusNode: showResetPasswordFields
                          ? _confirmPasswordFocusNode
                          : _numberFocusNode,
                      controller: showResetPasswordFields
                          ? _confirmPasswordController
                          : _numberController,
                      decoration: InputDecoration(
                        labelText: showResetPasswordFields
                            ? '비밀번호 재입력'
                            : '휴대폰 번호를 입력해주세요',
                        labelStyle: TextStyle(
                          color: showResetPasswordFields
                              ? _confirmPasswordLabelColor
                              : (_numberFocusNode.hasFocus
                                  ? Color(0xFF43D9C0)
                                  : Color(0xFF323232)),
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF43D9C0)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(showResetPasswordFields
                            ? '영문, 숫자 포함 8자 이상'
                            : '숫자만 입력해주세요'),
                      ),
                    )
                  ],
                ],
              ),
            ),
            Flexible(child: SizedBox(height: 280)), // 간격 조절
            Container(
              width: 280,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: Color(0xFF43D9C0)),
                color: Color(0xFF43D9C0),
              ),
              child: ElevatedButton(
                onPressed: () => checkAndShowModal(context),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  showResetPasswordFields ? '비밀번호 재설정' : '확인',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text("@2023 Dogdoc All copyrights reserved"),
          ],
        ),
      ),
    );
  }

  void checkAndShowModal(BuildContext context) {
    if (!isPasswordRecovery &&
        _nameController.text == testName &&
        _numberController.text == testNumber) {
      showReusableModalBottomSheet(
        context: context,
        child: CustomBottomSheet(
          title: '입력하신 정보로 가입된 한 개의 고객 계정이 확인됩니다.',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                '해당 계정으로 로그인해주세요.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFF4BBAC3),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Icon(Icons.email_outlined), // 이메일 아이콘
                  SizedBox(width: 5), // 아이콘과 텍스트 사이의 여백
                  Text(maskEmail(testEmail)), // 이메일 텍스트
                  SizedBox(width: 5), // 텍스트와 체크 아이콘 사이의 여백
                  Icon(Icons.check), // 체크 아이콘
                  SizedBox(width: 5), // 체크 아이콘과 텍스트 사이의 여백
                  Text('인증완료'), // 인증완료 텍스트
                ],
              )
            ],
          ),
          buttonContent: Text(
            '확인',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onButtonPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    } else if (isPasswordRecovery && _emailController.text == testEmail) {
      // 일치하지 않는 경우의 로직
      showReusableModalBottomSheet(
        context: context,
        child: CustomBottomSheet(
          title: '입력한 이메일 주소로 인증 메일이 발송되었습니다.',
          content: Text(''),
          buttonContent: Text(
            '확인',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onButtonPressed: () {
            Navigator.pop(context);
            setState(() {
              showResetPasswordFields = true;
            });
          },
        ),
      );
    } else {
      if (isPasswordRecovery && _emailController.text != testEmail ||
          _numberController.text != testNumber ||
          _nameController.text != testName) {
        // 일치하지 않는 경우의 로직
        showReusableModalBottomSheet(
          context: context,
          child: CustomBottomSheet(
            title: '입력한 정보로 가입된 계정정보가 확인되지 않습니다.'
                '고객 센터로 문의해주세요',
            content: Text(''),
            buttonContent: Text(
              '홈으로 가기',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onButtonPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      }
      // 이메일과 다른 값을 비교하는 로직도 추가할 수 있습니다.
    }
  }

  // 이메일 주소를 *로 마스킹하는 함수
  String maskEmail(String email) {
    var parts = email.split('@');
    if (parts.length != 2) return email; // 이메일 형식이 아니면 그대로 반환

    var namePart = parts[0];
    if (namePart.length <= 4) return email; // 이름 부분이 너무 짧으면 그대로 반환

    var maskedNamePart =
        '${namePart.substring(0, namePart.length - 2)}**'; // 앞의 4글자를 제외하고 나머지를 *로 바꿈

    return '$maskedNamePart@${parts[1]}'; // 바뀐 이름 부분과 @ 뒤의 도메인 부분을 합침
  }
}
