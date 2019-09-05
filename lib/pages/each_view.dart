import 'package:flutter/material.dart';
import 'package:flutter_demo_1/widgets/mosha.dart';

class EachView extends StatefulWidget {
  final String _title;

  EachView(this._title);

  @override
  _EachViewState createState() => _EachViewState();
}

class _EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget._title),
          elevation: 0, //appbar下面的阴影设置
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey,
          child: Mosha(),
        ));
  }
}
