import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_1/plugin/func_interface.dart';

class PluginUtil extends FunctionInterface {
  PluginUtil._();

  static PluginUtil _instance;

  static PluginUtil getInstance() {
    if (_instance == null) {
      _instance = PluginUtil._();
    }
    return _instance;
  }

  static const basicPlatform  = const BasicMessageChannel(FunctionInterface.Basic_Plugin, StandardMessageCodec());
  static const methodPlatform = const MethodChannel(FunctionInterface.Method_Plugin);
  static const eventPlatform  = const EventChannel(FunctionInterface.Event_Plugin);

  /// event Native端 发送
/*
  EventChannel(flutterView, "com.simple.channelflutterandroid/event")
      .setStreamHandler(object : EventChannel.StreamHandler {
        override fun onListen(o: Any?, eventSink: EventChannel.EventSink) {
          eventSink.success("我是发送Native的消息")
        }
        override fun onCancel(o: Any?) {
          // ...
        }
      }
      )
*/

  /// event 接收
  void receiveEventMessage() {
    eventPlatform.receiveBroadcastStream().listen((event) async {
      print("Flutter打印：event----$event");
    });
  }

  /// basic 发送
  Future<String> sendBasicMessage(dynamic msg) async {
    String reply = await basicPlatform.send(msg);
    print(reply);
    return reply;
  }

  /// basic 接收
  void receiveBasicMessage() {
    basicPlatform.setMessageHandler((message) async {
      print("Flutter打印：basic----" + message);
      return "is ok";
    });
  }

  /// method 发送
  Future<dynamic> sendMethodMessage(String msg) async {
    Future<dynamic> result = await methodPlatform.invokeMethod(FunctionInterface.Show_Message, {"msg": msg});
    print("Flutter打印：method----" + result.toString());
    return result;
  }

  /// method 接收
  void receiveMethodMessage() {
    methodPlatform.setMethodCallHandler((MethodCall call) async {
      /// 实现监听
      switch (call.method) {
        case "message":
          String msg = call.arguments;
          print("Flutter打印：method---" + msg);
          return "我是Flutter方法";
          break;
      }
    });
  }

  /// method 打开新的 Native Activity
  void startActivity(String activityName) async {
    Map<String, String> map = {"data": activityName};
    String result = await methodPlatform.invokeMethod(
        FunctionInterface.Start_Activity, map);
    print("Flutter打印：method---" + result);
  }

  /// method 显示原生Toast
  void showToast(String msg) async {
    Map<String, String> map = {"data": msg};
    String result =
        await methodPlatform.invokeMethod(FunctionInterface.Show_Toast, map);
    print("Flutter打印：method---" + result);
  }

  /// method 显示原生Log
  void showLog(String msg) async {
    Map<String, String> map = {"data": msg};
    String result =
        await methodPlatform.invokeMethod(FunctionInterface.Show_Log, map);
    print("Flutter打印：method---" + result);
  }

  /// 打开新的Flutter
  void startFlutter(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(builder: (builderContext) {
      return widget;
    }));
  }














}
