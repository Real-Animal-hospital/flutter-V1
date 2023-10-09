import 'package:animal_hospital/home/dogdrHome/presentation/home_screen_view.dart';
import 'package:flutter/material.dart';

class DogDrBottomNavigationWidget extends StatefulWidget {
  const DogDrBottomNavigationWidget({super.key});

  @override
  State<DogDrBottomNavigationWidget> createState() =>
      _DogDrBottomNavigationWidgetState();
}

class _DogDrBottomNavigationWidgetState
    extends State<DogDrBottomNavigationWidget> {
  int _currentIndex = 0;

  final _pages = const [
    DogDrHomeScreen(),
    DogDrHomeScreen(),
    DogDrHomeScreen(),
    DogDrHomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            activeIcon: Icon(Icons.home_filled),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search),
            label: '병원검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            activeIcon: Icon(Icons.bookmark),
            label: '보관함',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            activeIcon: Icon(Icons.account_circle),
            label: '프로필',
          ),
        ],
        selectedItemColor: const Color(0xFF43D9C0),
        unselectedItemColor: const Color(0xFF414941),
        selectedLabelStyle: const TextStyle(
          color: Color(0xFF323232),
          fontSize: 13,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w500,
          letterSpacing: 0.10,
        ),
        // 선택된 아이템 레이블 스타일
        unselectedLabelStyle: const TextStyle(
          color: Color(0xFF323232),
          fontSize: 13,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w500,
          letterSpacing: 0.10,
        ),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
