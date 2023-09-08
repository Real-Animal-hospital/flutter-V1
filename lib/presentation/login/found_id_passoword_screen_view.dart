import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FoundIdPassword extends StatefulWidget {
  const FoundIdPassword({super.key});

  @override
  State<FoundIdPassword> createState() => _FoundIdPasswordState();
}

class _FoundIdPasswordState extends State<FoundIdPassword> {
  @override
  Widget build(BuildContext context) {
    // 가로 회전 안되게 하는 코드
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = AppBar().preferredSize.height;
    final availableHeight = screenHeight - appBarHeight - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("아이디/비밀번호 찾기"),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: availableHeight,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: availableHeight * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text('메일아이디 찾기'),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text('비밀번호 찾기'),
                      ),
                    ],
                  ),
                  SizedBox(height: availableHeight * 0.05),
                  Container(
                    width: 320,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '이메일을 입력해주세요',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
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
                  SizedBox(height: availableHeight * 0.05),
                  Text("@2023 Dogdoc All copyrights reserved"),
                ],
              ),
            ],
          ),
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
