package io.flutter.plugins;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.widget.Toast;

import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.android.FlutterView;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    static final String METHOD_CHANNEL = "com.zhuandian.flutter/android";
    private static final String EVENT_CHANNEL = "com.zhuandian.flutter/android/event"; //事件通道，供原生主动调用flutter端使用
    private static final String METHOD_NATIVE_SEND_MESSAGE_FLUTTER = "nativeSendMessage2Flutter"; //原生主动向flutter发送消息
    private EventChannel.EventSink eventChannel;
    private MethodChannel methodChannel;

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        methodChannel=new MethodChannel(flutterEngine.getDartExecutor(), METHOD_CHANNEL);
        methodChannel.setMethodCallHandler(
                (call, result) -> {
                    // 在主线程中执行
                    if (call.method.equals("getBatteryLevel")) {
                        Toast.makeText(this, "我是原生", Toast.LENGTH_SHORT).show();
                        // 获取电量
                        int batteryLevel = getBatteryLevel();
                        if (batteryLevel != -1) {
                            // 将电量返回给 Flutter 调用
                            result.success(batteryLevel);
                        } else {
                            result.error("UNAVAILABLE", "Battery level not available.", null);
                        }
                    }
                    if (call.method.equals("showToast")) {
                        Toast.makeText(this, "我是原生fdffd", Toast.LENGTH_SHORT).show();
                        result.success("我是原生fdffd");
//                            result.error("UNAVAILABLE", "Battery level not available.", null);
                    }else if (call.method.equals(METHOD_NATIVE_SEND_MESSAGE_FLUTTER)) {
                        nativeSendMessage2Flutter();
                    }else {
                        result.notImplemented();
                    }
                });


        new EventChannel(flutterEngine.getDartExecutor(), EVENT_CHANNEL).setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object o, EventChannel.EventSink eventSink) {
                eventChannel = eventSink;
                eventSink.success("事件通道准备就绪");
                //在此不建议做耗时操作，因为当onListen回调被触发后，在此注册当方法需要执行完毕才算结束回调函数
                //的执行，耗时操作可能会导致界面卡死，这里读者需注意！！
            }

            @Override
            public void onCancel(Object o) {

            }
        });
    }

    // 获取电量的方法
    public int getBatteryLevel() {
        int batteryLevel;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(getApplicationContext()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }

        return batteryLevel;
    }

    /**
     * 原生端向flutter主动发送消息；
     */
    private void nativeSendMessage2Flutter() {
        //主动向flutter发送一次更新后的数据
//        eventChannel.success("原生端向flutter主动发送消息");
        Map<String,Object> params = new HashMap<>();
        params.put("params","test params");
        methodChannel.invokeMethod("getFlutterResult", params); //调用Flutter方代码
    }

    public void showToast() {
        Toast.makeText(this, "我是原生", Toast.LENGTH_SHORT).show();
    }

}
