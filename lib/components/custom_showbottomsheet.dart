import 'package:flutter/material.dart';

// 모달 바텀 시트에 들어갈 커스텀 위젯
class CustomBottomSheet extends StatelessWidget {
  final String title;
  final Widget content;
  final Widget buttonContent;
  final VoidCallback? onButtonPressed;

  const CustomBottomSheet({
    super.key,
    required this.title,
    required this.content,
    required this.buttonContent, // 버튼 내용
    this.onButtonPressed, // 버튼 액션
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min, // 위젯의 크기를 최소화
          children: [
            const SizedBox(height: 100),
            // 텍스트 한글 기준 19자 넘어가면 화면에서 다음 줄로 넘어감. ( 띄어쓰기하면 19자 넘으면 안됨 )
            SizedBox(
              width: 260,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              width: 260,
              child: content,
            ),
            const SizedBox(height: 100),
            Container(
              width: 280,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: const Color(0xFF43D9C0)),
                color: const Color(0xFF43D9C0),
              ),
              child: ElevatedButton(
                // onButtonPressed가 null값이면 Navigator.pop이 실행됨.
                onPressed: onButtonPressed ??
                    () {
                      Navigator.pop(context);
                    },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF43D9C0), // 배경색을 투명하게 설정
                  elevation: 0, // 그림자 효과 없애기
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: buttonContent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 모달 바텀 시트를 띄우는 함수
void showReusableModalBottomSheet({
  required BuildContext context,
  required Widget child,
  String? buttonText,
  VoidCallback? buttonAction,
}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            child,
            if (buttonText != null && buttonAction != null)
              ElevatedButton(
                onPressed: buttonAction,
                child: Text(
                  buttonText,
                ),
              ),
          ],
        ),
      );
    },
  );
}
