package com.clearliang.flutter_demo_1;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    // 注册供Flutter调用的原生方法
    registerCustomPlugin(this);
  }

  private static void registerCustomPlugin(PluginRegistry registrar) {

    PluginFlutterToNative1.registerWith(registrar.registrarFor(PluginFlutterToNative1.CHANNEL));
    PluginFlutterToNative2.registerWith(registrar.registrarFor(PluginFlutterToNative2.CHANNEL));
    //PluginNativeToFlutter1.registerWith(registrar.registrarFor(PluginNativeToFlutter1.CHANNEL));
  }

}
