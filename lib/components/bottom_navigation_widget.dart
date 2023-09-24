import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  final ValueChanged<int> onItemTapped;
  final int currentIndex;

  const BottomNavigationWidget({
    Key? key,
    required this.onItemTapped,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.local_hospital_outlined),
          activeIcon: Icon(Icons.local_hospital),
          label: '증상찾기',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          activeIcon: Icon(Icons.search),
          label: '병원검색',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border),
          activeIcon: Icon(Icons.bookmark),
          label: '북마크',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: '증상찾기',
        ),
      ],
      selectedItemColor: const Color(0xFF608BFF),
      unselectedItemColor: const Color(0xFF414941),
      currentIndex: widget.currentIndex,
      onTap: widget.onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }
}
