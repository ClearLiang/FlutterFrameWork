package com.clearliang.flutter_demo_1;

import android.app.Activity;
import android.util.Log;
import android.widget.Toast;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

/**
 * Created by ClearLiang on 2019/5/29
 * <p>
 * Function : flutter与原生交互的插件二
 */
public class PluginFlutterToNative2 implements MethodChannel.MethodCallHandler {
    static String CHANNEL = "com.flutter.jump/flutterToNative2";

    static MethodChannel channel;

    private Activity activity;

    private PluginFlutterToNative2(Activity activity) {
        this.activity = activity;
    }

    static void registerWith(PluginRegistry.Registrar registrar) {
        channel = new MethodChannel(registrar.messenger(), CHANNEL);
        PluginFlutterToNative2 instance = new PluginFlutterToNative2(registrar.activity());
        channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {

        //通过MethodCall可以获取参数和方法名，然后再寻找对应的平台业务
        switch (methodCall.method) {
            //接收来自flutter的指令oneAct
            case "oneAct":
                // Toast 提示
                Toast.makeText(activity, "第二个Plugin", Toast.LENGTH_LONG).show();
                //返回给flutter的参数
                result.success("success");
                break;
            //接收来自flutter的指令twoAct
            case "twoAct":
                //解析参数
                String text = methodCall.argument("flutter");
                Log.e("信息", text);
                //返回给flutter的参数
                result.success("success");
                break;
            default:
                result.notImplemented();
                break;
        }
    }

}
