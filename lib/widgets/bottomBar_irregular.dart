import 'package:flutter/material.dart';
import 'package:flutter_demo_1/widgets/custom_router.dart';
import 'package:flutter_demo_1/pages/each_view.dart';

/// 不规则底部导航栏

class BottomAppBarDemo extends StatefulWidget {
  @override
  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  List<Widget> _eachView = List();
  int _index = 0;

  @override
  void initState() {
    _eachView..add(EachView("主页"))..add(EachView("设置"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[_index],
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          /*Navigator.of(context).push(MaterialPageRoute(builder: (buildContext) {
            return EachView("New Page");
          }));*/
          Navigator.of(context).push(CustomRoute(EachView("New Page")));
        },
        tooltip: "提示",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _index = 0;
                });
              },
              padding: EdgeInsets.all(0.0),
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _index = 1;
                });
              },
              padding: EdgeInsets.all(0.0),
            ),
          ],
        ),
      ),
    );
  }
}
