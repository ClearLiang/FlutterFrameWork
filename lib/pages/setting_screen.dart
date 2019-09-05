import 'package:flutter/material.dart';

void main()=>runApp(SettingScreen());

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting Screen"),
      ),
      body: Center(
        child: Text("这是Setting界面"),
      ),
    );
  }
}
