import 'package:animal_hospital/intro_view/introduce/section/introduce_first_screen_view.dart';
import 'package:animal_hospital/intro_view/introduce/section/introduce_second_screen_view.dart';
import 'package:animal_hospital/intro_view/introduce/section/introduce_third_screen_view.dart';
import 'package:animal_hospital/intro_view/splash/presentation/splash_first_screen_view.dart';
import 'package:flutter/material.dart';

class IntroduceScreenView extends StatefulWidget {
  const IntroduceScreenView({super.key});

  @override
  State<IntroduceScreenView> createState() => _IntroduceScreenViewState();
}

class _IntroduceScreenViewState extends State<IntroduceScreenView> {
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      setState(() {
        _currentPage++;
      });
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          _nextPage();
        },
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: _buildPage(_currentPage),
            ),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    Widget content = Container(); // 빈 컨테이너로 초기화

    switch (index) {
      case 0:
        content = IntroduceFirstScreen();
        break;
      case 1:
        content = IntroduceSecondScreen();
        break;
      case 2:
        content = IntroduceThirdScreen();

        break;
      default:
        content = Container();
        break;
    }

    return Column(
      key: ValueKey<int>(_currentPage),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: content), // content가 차지할 수 있는 최대 공간을 차지하도록 설정
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) => _buildDot(index)), // 인디케이터
        ),

        SizedBox(height: 15),
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          child: const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
        const SizedBox(height: 40),
        const Text(
          "@2023 Dogdoc All copyrights reserved",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: _currentPage == index ? 12 : 12,
      height: _currentPage == index ? 12 : 12,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.black : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}





void main() {
  runApp(MaterialApp(
    home: IntroduceScreenView(),
  ));
}
