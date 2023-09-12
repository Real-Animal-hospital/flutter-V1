import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FoundIdPassword extends StatefulWidget {
  const FoundIdPassword({super.key});

  @override
  State<FoundIdPassword> createState() => _FoundIdPasswordState();
}

// TODO: 아이디/비밀번호 찾기 간격 조절
class _FoundIdPasswordState extends State<FoundIdPassword> {
  bool isPasswordRecovery = false;

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
                    decoration: InputDecoration(
                      hintText:
                          isPasswordRecovery ? '이름을 입력해주세요' : '이메일을 입력해주세요',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  if (isPasswordRecovery) ...[
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        hintText: '휴대폰 번호를 입력해주세요',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ]
                ],
              ),
            ),
            SizedBox(height: 100),
            Container(
              width: 280,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: Color(0xFF43D9C0)),
                color: Color(0xFF43D9C0),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('확인'),
              ),
            ),
            SizedBox(height: 30),
            Text("@2023 Dogdoc All copyrights reserved"),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FoundIdPassword(),
  ));
}
