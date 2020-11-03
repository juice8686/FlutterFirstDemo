import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_juice/pages/HomePage.dart';
import 'package:flutter_juice/pages/CreditPage.dart';
import 'package:flutter_juice/pages/PayPage.dart';
import 'package:flutter_juice/pages/MinePage.dart';

/**
 * 直接调用app里原生平台里的相关方法（区别于插件开发：插件开发也是利用methodChanneljiaohu
 * 调用原生平台的方式，只不过，利用插件开发，把相关方法定义封装在单独的flutter_lib里，
 * 主项目不必关注具体实现细节，只负责调用就行具体实现有插件完成，而直接调用平台里的原生
 * 平台方法一般需要开发者自己去实现相关方法定义，读者可对比插件交互部分代码自行对比
 * ）
 */
import 'package:flutter/cupertino.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              'Flutter实战'
          ),
          centerTitle: true,
        ),
        body: AndroidPlatformPage(),
        bottomNavigationBar: MyBottomNavigationBar(),
      ),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyBottomNaState();
  }
}

class MyBottomNaState extends State<MyBottomNavigationBar> {
  var _currentIndex = 0;
  var _bottomColor = Colors.blue;
  List<Widget> pageWidges = List();

  @override
  void initState() {
    pageWidges.add(HomePage());
    pageWidges.add(CreditPage());
    pageWidges.add(PayPage());
    pageWidges.add(MinePage());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('标题栏title'),
      ),
      body: pageWidges[_currentIndex], //todo 这个是核心；属于点击替换 widget;而不是push页面
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.red,
          showUnselectedLabels: true,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Container(
                  child: Text(
                    'home',
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.access_time,
                ),
                title: Container(
                  child: Text(
                    'credit',
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.palette,
                ),
                title: Container(
                  child: Text(
                    'pay',
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.people,
                ),
                title: Container(
                  child: Text(
                    'mine',
                  ),
                )),
          ],
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
              _bottomColor = Colors.red;
            });
          },
        ),
      ),
      // theme: ThemeData(primarySwatch: Colors.blueGrey),
    ));
  }
}

class AndroidPlatformPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PageState();
}

class PageState extends State<AndroidPlatformPage> {
  static final String METHOD_CHANNEL = "com.zhuandian.flutter/android";
  static final String EVENT_CHANNEL = "com.zhuandian.flutter/android/event";
  static final String NATIVE_SHOW_TOAST =
      "showToast"; //原生android平台定义的供flutter端唤起的方法名
  static final String NATIVE_METHOD_ADD =
      "numberAdd"; //原生android平台定义的供flutter端唤起的方法名

  static final String NATIVE_SEND_MESSAGE_TO_FLUTTER =
      "nativeSendMessage2Flutter"; //原生主动向flutter发送消息

  static final MethodChannel _MethodChannel =
      MethodChannel(METHOD_CHANNEL); //平台交互通道
  static final EventChannel _EventChannel =
      EventChannel(EVENT_CHANNEL); //原生平台主动调用flutter端事件通道

  String _fromNativeInfo = "";

  @override
  void initState() {
    super.initState();
    _EventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onErroe);
    _MethodChannel.setMethodCallHandler(nativeCallHandler);
  }

  /**
   * 注册方法，等待被原生通过invokeMethod唤起
   */
  Future<dynamic> nativeCallHandler(MethodCall methodCall) async {
    switch (methodCall.method) {
      case "getFlutterResult":
        String paramsFromNative = await methodCall.arguments["params"];
        print("原生android传递过来的参数为------ $paramsFromNative");
        return "result from flutter";
        break;
    }
  }

  /**
   * 监听原生传递回来的值（通过eventChannel）
   */
  void _onEvent(Object object) {
    print(object.toString() + "-------------从原生主动传递过来的值");
    setState(() {
      _fromNativeInfo = object.toString();
    });
  }

  void _onErroe(Object object) {
    print(object.toString() + "-------------从原生主动传递过来的值");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text("flutter 与原生平台交互"),
        Text(_fromNativeInfo),
        RaisedButton(
          color: Colors.orangeAccent,
          child: Text("点击调用原生主动向flutter发消息方法"),
          onPressed: () async {
            String good = await _MethodChannel.invokeMethod(
                NATIVE_SEND_MESSAGE_TO_FLUTTER);
            // print("原生调用过来的=$good");
          },
        ),
        SizedBox(height: 30),
        RaisedButton(
          color: Colors.orangeAccent,
          child: Text("调用原生平台Toast"),
          onPressed: () {
            showNativeToast("flutter调用原生android的Toast");
          },
        ),
      ],
    );
  }

  void showNativeToast(String content) async {
    int result =
        await _MethodChannel.invokeMethod(NATIVE_SHOW_TOAST, {"msg": content});
    print("获取到原生的结果是=$result");
  }

  /**
   * 调用平台方法计算两个数的和，并调用原生toast打印出结果
   */
  void getNumberResult(int i, int j) async {
    Map<String, dynamic> map = {"number1": 12, "number2": 43};
    int result = await _MethodChannel.invokeMethod(NATIVE_METHOD_ADD, map);

    _MethodChannel.invokeMethod(NATIVE_SHOW_TOAST, {"msg": "12+43= $result"});
  }
}
