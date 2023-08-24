import 'package:flutter/cupertino.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // material - Scaffold
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        // material - AppBar
        middle: Text('Cupertino Animal-hospital'),
      ),
      child: Container(),
    );
  }
}
