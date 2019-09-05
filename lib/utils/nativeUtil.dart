import 'package:flutter/services.dart';

/// 网络请求
///
/// 注意事项，一定要写 T 的类型
/// T 的Bean一定要先写

class NativeUtil {
  NativeUtil._();

  static NativeUtil _instance;
  static const String _pluginNativeToFlutter1 = "com.flutter.jump/nativeToFlutter1";
  static const String _pluginFlutterToNative1 = "com.flutter.jump/flutterToNative1";
  static const String _pluginFlutterToNative2 = "com.flutter.jump/flutterToNative2";

  static NativeUtil getInstance() {
    if (_instance == null) {
      _instance = NativeUtil._();
    }
    return _instance;
  }

  String _oneAct = 'oneAct';
  String _twoAct = 'twoAct';

  //获取到插件与原生的交互通道
  dynamic _jumpPlugin = const MethodChannel(_pluginFlutterToNative1);

  Future<Null> jumpToNative() async {
    String result = await _jumpPlugin.invokeMethod(_oneAct);
    print(result);
  }

  Future<Null> jumpToNativeWithValue() async {
    Map<String, String> map = {"flutter": "这是一条来自flutter的参数"};

    String result = await _jumpPlugin.invokeMethod(_twoAct, map);

    print(result);
  }

}





