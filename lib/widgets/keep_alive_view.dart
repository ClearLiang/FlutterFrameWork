import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_demo_1/api/apis.dart';
import 'package:flutter_demo_1/api/global.dart';
import 'package:flutter_demo_1/beans/movie_entity.dart';
import 'package:flutter_demo_1/beans/user_entity.dart';
import 'package:flutter_demo_1/utils/httpUtil.dart';
import 'package:flutter_demo_1/entity_factory.dart';
import 'package:flutter_demo_1/utils/nativeUtil.dart';

class AliveItem extends StatefulWidget {
  @override
  _AliveItemState createState() => _AliveItemState();
}

class _AliveItemState extends State<AliveItem> with AutomaticKeepAliveClientMixin {
  int _counter = 0;

  static const counterPlugin = const EventChannel('com.flutter.jump/nativeToFlutter1');
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    //开启监听
    if(_subscription == null){
      _subscription =  counterPlugin.receiveBroadcastStream().listen(_onEvent,onError: _onError);
    }
  }

  @override
  void dispose() {
    super.dispose();
    //取消监听
    if(_subscription != null){
      _subscription.cancel();
    }
  }

  void _onEvent(Object event) {
    setState(() {
      print("ChannelPage: $event");
    });
  }

  void _onError(Object error) {
    setState(() {
      print(error);
    });
  }


  @override
  bool get wantKeepAlive => true;

  void _increaseCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: SizedBox(
                width: 200.0,
                height: 50.0,
                child: Container(
                  color: Colors.lightBlue,
                  alignment: Alignment.center,
                  child: Text(
                    "当前数值",
                    style: TextStyle(),
                  ),
                ),
              ),
              //发生点击事件后回调
              onTap: () {
                print("一次");
                _getHttp();
              },
              //发生双击时间后回调
              onDoubleTap: () {
                print("两次");
              },
              //长按事件
              onLongPress: () {
                print("长按......");
                NativeUtil.getInstance().jumpToNative();
              },
            ),
            Text(
              "$_counter",
              style: Theme.of(context).textTheme.display1,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _increaseCounter();
        },
        tooltip: "+1",
        child: Icon(Icons.add),
      ),
    );
  }

  void _getHttp() async {
    Map<String, dynamic> param = {
      "search": "15051950170",
      "token":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdW5TY2hvb2xfaXNzIjoiU2VydmljZSIsIm9wZW5pZCI6IjU3Y2I1YTI2MzM0YTZjMWQ1ZTI3YzQ5ZGVmNGEwZjBkIiwib3BlbmlkTWQ1IjoiNTdjYjVhMjYzMzRhNmMxZDVlMjdjNDlkZWY0YTBmMGQiLCJzdW5TY2hvb2xfdXNlcklkIjoiNjEiLCJleHAiOjE1ODk2MTc5MjAsImlhdCI6MTU1ODA4MTkyMCwic3VuU2Nob29sX2F1ZCI6IkFQUCJ9.sNezp0ejJeuQCsgus08IRfyiYTJ2GsWPhfJubpGvHzE"
    };

    HttpUtil.getInstance().get<UserEntity>(
      Api.user1Url,
      (UserEntity result) {
        result.persons.forEach((person){
          print(person.name);
        });
      },
      errorCallBack: (errorMsg) {
        print(errorMsg);
      },
    );
  }
}
