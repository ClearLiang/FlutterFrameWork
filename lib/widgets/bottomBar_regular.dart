import 'package:flutter/material.dart';
import 'package:flutter_demo_1/pages/home_screen.dart';
import 'package:flutter_demo_1/pages/message_screen.dart';
import 'package:flutter_demo_1/pages/setting_screen.dart';

/// 规则底部导航栏

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  // ignore: non_constant_identifier_names
  final _BottomNavigationColor = Colors.lightBlueAccent;

  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    // ..返回一个List，所以可以连续使用
    list
      ..add(HomeScreen())
      ..add(MessageScreen())
      ..add(SettingScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _BottomNavigationColor,
            ),
            title: Text(
              "主页",
              style: TextStyle(color: _BottomNavigationColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: _BottomNavigationColor,
            ),
            title: Text(
              "消息",
              style: TextStyle(color: _BottomNavigationColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: _BottomNavigationColor,
            ),
            title: Text(
              "设置",
              style: TextStyle(color: _BottomNavigationColor),
            ),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
