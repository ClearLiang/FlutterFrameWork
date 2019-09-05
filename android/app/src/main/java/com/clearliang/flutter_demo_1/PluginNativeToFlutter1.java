package com.clearliang.flutter_demo_1;

import android.app.Activity;
import android.util.Log;

import java.util.logging.Handler;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.PluginRegistry;

/**
 * Created by ClearLiang on 2019/5/29
 * <p>
 * Function :
 */
public class PluginNativeToFlutter1 implements EventChannel.StreamHandler {

    static String CHANNEL = "com.flutter.jump/nativeToFlutter1";

    static EventChannel channel;

    private Activity activity;

    private PluginNativeToFlutter1(Activity activity) {
        this.activity = activity;
    }

    static void registerWith(PluginRegistry.Registrar registrar) {
        channel = new EventChannel(registrar.messenger(), CHANNEL);
        PluginNativeToFlutter1 instance = new PluginNativeToFlutter1(registrar.activity());
        channel.setStreamHandler(instance);
    }

    @Override
    public void onListen(Object o, final EventChannel.EventSink eventSink) {
        new Thread(() -> {
            try {
                Thread.sleep(5000);//延时1s
                //do something
                eventSink.success("我来自Native");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }).start();

    }

    @Override
    public void onCancel(Object o) {
        Log.e("PluginNativeToFlutter1", "PluginNativeToFlutter1:onCancel");
    }

}