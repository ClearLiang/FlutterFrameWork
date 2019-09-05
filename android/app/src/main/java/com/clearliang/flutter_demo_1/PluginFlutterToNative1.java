package com.clearliang.flutter_demo_1;

import android.app.Activity;
import android.content.Intent;
import android.util.Log;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

/**
 * Created by ClearLiang on 2019/5/29
 * <p>
 * Function : flutter与原生交互的插件二
 */
public class PluginFlutterToNative1 implements MethodChannel.MethodCallHandler {
    static String CHANNEL = "com.flutter.jump/flutterToNative1";

    static MethodChannel channel;

    private Activity activity;

    private PluginFlutterToNative1(Activity activity) {
        this.activity = activity;
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        channel = new MethodChannel(registrar.messenger(), CHANNEL);
        PluginFlutterToNative1 instance = new PluginFlutterToNative1(registrar.activity());
        //setMethodCallHandler在此通道上接收方法调用的回调
        channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {

        //通过MethodCall可以获取参数和方法名，然后再寻找对应的平台业务
        switch (call.method) {
            //接收来自flutter的指令oneAct
            case "oneAct":
                // Toast 提示
                Intent intent = new Intent(activity, Plugin1Activity.class);
                activity.startActivity(intent);
                result.success("success");
                break;
            //接收来自flutter的指令twoAct
            case "twoAct":
                //解析参数
                String text = call.argument("flutter");
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
