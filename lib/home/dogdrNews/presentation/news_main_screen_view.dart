import 'package:animal_hospital/home/dogdrNews/presentation/news_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// 다른 import 문들...

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // 여기에서 뒤로가기 버튼을 눌렀을 때 실행할 로직을 정의
        // 예를 들어, 홈 화면으로 이동:
        context.go('/home');
        return false; // 시스템 뒤로가기 동작을 막음
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('뉴스'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.go('/home');
            },
          ),
        ),
       body: const NewsScreenView(),
      ),
    );
  }
}
