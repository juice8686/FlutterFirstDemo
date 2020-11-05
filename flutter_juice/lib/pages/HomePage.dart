import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_juice/net/NetManager.dart';
import 'package:toast/toast.dart';

import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<HomePage> {
  var netResult = "我是初始值";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Wrap(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                color: Colors.blueGrey,
                child: Text('Dart 原生的网络请求 HttpClient'),
                onPressed: () {
                  print("点击处理");
                },
              ),
            ),
            Expanded(
              child: RaisedButton(
                color: Colors.green,
                child: Text('库 http'),
                onPressed: () {
                  print("点击处理");
                },
              ),
            ),
            Expanded(
              child: RaisedButton(
                color: Colors.red,
                child: Text(netResult),
                onPressed: () {
                  print("点击处理Flutter 发布的 dio");
                  // getRequest();
                  postRequest();
                },
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  height: 180,
                  child: Image.network(
                      "https://www.itying.com/images/flutter/2.png",
                      fit: BoxFit.cover),
                )),
            SizedBox(width: 10),
            Expanded(
                flex: 1,
                child: Container(
                    height: 180,
                    child: ListView(
                      children: <Widget>[
                        Container(
                          height: 85,
                          child: Image.network(
                              "https://www.itying.com/images/flutter/3.png",
                              fit: BoxFit.cover),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 85,
                          child: Image.network(
                              "https://www.itying.com/images/flutter/3.png",
                              fit: BoxFit.cover),
                        )
                      ],
                    ))),
            Expanded(
                flex: 1,
                child: Container(
                    height: 180,
                    child: ListView(
                      children: <Widget>[
                        Container(
                          height: 85,
                          child: Image.network(
                              "https://www.itying.com/images/flutter/3.png",
                              fit: BoxFit.cover),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 85,
                          child: Image.network(
                              "https://www.itying.com/images/flutter/3.png",
                              fit: BoxFit.cover),
                        )
                      ],
                    ))),
          ],
        ),
        Center(
          child: Column(
            children: <Widget>[
              CountDownWidget(
                onCountDownFinishCallBack: (bool value,String reault) {
                  if (value) {
                    setState(() {
                      // showAd = false;
                      Toast.show("倒计时结束回调$reault", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  static const base_url =
      "http://kartuone-app-test2.cf57eaa4fd3624fc39ab5ed0955c6048a.cn-beijing.alicontainer.com/appserver";

  void getRequest() async {
    Dio dio = new Dio();
    var response = await dio.get(base_url);
    var _content = response.data.toString();
    print("请求回来的数据=" + _content);
  }

  /**
   * 最简单的使用
   */
  void postRequest() async {

    // or new Dio with a BaseOptions instance.
    BaseOptions options = new BaseOptions(
      baseUrl: base_url,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    Dio dio = new Dio(options);
    var response = await dio.post('/v2/banner/startup-page');
    var _content = response.data.toString();
    print("请求回来的数据=" + _content);
    Toast.show("请求回来的数据=$_content", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    setState(() {
      netResult = "我是结果=$_content";
    });
  }
}



class CountDownWidget extends StatefulWidget {
  final onCountDownFinishCallBack;

  CountDownWidget({Key key, @required this.onCountDownFinishCallBack})
      : super(key: key);

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  var _seconds = 6;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_seconds',
      style: TextStyle(fontSize: 17.0),
    );
  }

  /// 启动倒计时的计时器。
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      if (_seconds <= 1) {
        widget.onCountDownFinishCallBack(true,'倒计时马上要结束了');
        _cancelTimer();
        return;
      }
      _seconds--;
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    _timer?.cancel();
  }
}
