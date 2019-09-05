import 'package:flutter/material.dart';
import 'package:flutter_demo_1/widgets/keep_alive_view.dart';

void main() => runApp(StateSave());

class StateSave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KeepAlive(),
    );
  }
}

class KeepAlive extends StatefulWidget {
  @override
  _KeepAliveState createState() => _KeepAliveState();
}

class _KeepAliveState extends State<KeepAlive> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab切换，状态保存"),
        bottom: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.brightness_medium),
            ),
            Tab(
              icon: Icon(Icons.delete),
            ),
            Tab(
              icon: Icon(Icons.receipt),
            ),
          ],
          controller: _controller,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          AliveItem(),
          AliveItem(),
          AliveItem(),
        ],
      ),
    );
  }
}
