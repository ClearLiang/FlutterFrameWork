import 'package:flutter/material.dart';
import 'package:flutter_demo_1/widgets/bottomBar_irregular.dart';
import 'package:flutter_demo_1/widgets/bottomBar_regular.dart';
import 'widgets/StateSave.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter bottomNavigationBar',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: BottomNavigationWidget(),
    );
  }
}


