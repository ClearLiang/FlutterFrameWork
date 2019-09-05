
import 'package:flutter/material.dart';





abstract class FunctionInterface {

  // ...定义实例变量和方法...
  static const String Basic_Plugin = "com.liang.flutter.plugin/basic";

  static const String Method_Plugin = "com.liang.flutter.plugin/method";
  static const String Start_Activity = "startActivity";
  static const String Start_Flutter = "startFlutter";
  static const String Show_Toast = "showToast";
  static const String Show_Log = "showLog";
  static const String Log_Argument = "data";
  static const String Show_Message = "message";
  static const String Receive_Message = "receiveMessage";

  static const String Event_Plugin = "com.liang.flutter.plugin/event";

  /// event 接收
  void receiveEventMessage();
  /// basic 发送
  Future<String> sendBasicMessage(dynamic msg);
  /// basic 接收
  void receiveBasicMessage();
  /// method 发送
  void sendMethodMessage(String msg);
  /// method 接收
  void receiveMethodMessage();

  /// method 打开新的 Native Activity
  void startActivity(String activityName);
  /// method 显示原生Toast
  void showToast(String msg);
  /// method 显示原生Log
  void showLog(String msg);

  /// 打开新的Flutter
  void startFlutter(BuildContext context, Widget widget);





}
