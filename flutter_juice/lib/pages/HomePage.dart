import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_juice/net/NetManager.dart';
import 'package:flutter_juice/net/bean/CodeBean.dart';
import 'package:flutter_juice/pages/DetailPage.dart';
import 'file:///E:/flutter_juice/flutter_juice/lib/animation/AnimatedCrossFadeDemo.dart';
import 'package:toast/toast.dart';
import 'package:flutter/gestures.dart';

import 'dart:async';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {//flutter扫描widgt时调用createElement(),Elemnt构造方法时会触发此方法
    // TODO: implement createState
    return new HomeState();
  }

}

class HomeState extends State<HomePage> {
  var netResult = "我是初始值";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(0.0),
            width: MediaQuery.of(context).size.width,
            alignment: AlignmentDirectional.center,
            height: 37.0,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 237, 236, 237),
                borderRadius: BorderRadius.circular(24.0)),
            child: TextField(
              // onSubmitted: onSubmitted,
              // onTap: onTab,
              cursorColor: Color.fromARGB(255, 0, 189, 96),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 8.0),
                  border: InputBorder.none,
                  hintText: 'please input',
                  hintStyle: TextStyle(
                      fontSize: 17, color: Color.fromARGB(255, 192, 191, 191)),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 25,
                    color: Color.fromARGB(255, 128, 128, 128),
                  )),
              style: TextStyle(fontSize: 17),
            ),
          ),
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
                    var future = postRequest();
                    var stream = future.then((value) {
                      print("点击处理Flutter future.then,value=$value");

                    })..whenComplete((){
                      print("点击处理Flutter future.whenComplete");
                    })..asStream();
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
                  onCountDownFinishCallBack: (bool value, String reault) {
                    if (value) {
                      setState(() {
                        // showAd = false;
                        Toast.show("倒计时结束回调$reault", context,
                            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          InkWell(
            child: Container(
              // margin: EdgeInsets.fromLTRB(10,12,12,12),
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              alignment: AlignmentDirectional.center,
              height: 67.0,
              // decoration: BoxDecoration(
              //     color: Color.fromARGB(255, 237, 236, 237),
              //     borderRadius: BorderRadius.circular(4.0)),
              child: Text(
                '水波纹效果',
                style: TextStyle(fontSize: 13.0, color: Colors.green),
              ),
            ),
            onTap: () {
              print('水波纹效果');
              // Router.push(context, Router.personDetailPage,
              //     {'personImgUrl': imgUrl, 'id': id});
            },
          ),
          RaisedButton(
            color: Colors.green,
            onPressed: () {
              setState(() {
                // widget.createElement();
              });
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                // return new DetailPage();
                return new AnimatedCrossFadeDemo();
              }));
            },
            child: Text("点击跳转第二个页面"),
          ),
          RichText(
            //富文本
            text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <InlineSpan>[
                  TextSpan(text: '登陆即视为同意'),
                  TextSpan(
                    text: '《xxx服务协议》',
                    style: TextStyle(color: Colors.red),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("跳转到协议页面");
                      },
                  ),
                ]),
          )
        ],
      ),
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
  Future<CodeBean> postRequest() async {
    // or new Dio with a BaseOptions instance.
    BaseOptions options = new BaseOptions(
      baseUrl: base_url,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    Dio dio = new Dio(options);
    // jsonObject.addProperty("verificationCode", code);
    // jsonObject.addProperty("type", 2);//0，下单；1，展期；2，换设备登录
    // jsonObject.addProperty("phone", phone);//0，下单；1，展期；2，换设备登录
    // var response = await dio.post('/v2/banner/startup-page');
    // var data={'verificationCode', "2332","type", 2,"phone", 1809893154645};
    // var data={'verificationCode', "2332"};
    // var data= Map.from({'verificationCode':"2332",'type':2,'phone':"1809898461"});
    try {
      var data = {
        'verificationCode': '1231',
        'type': 2,
        'phone': '180816541654'
      }; //requestBody
      var response =
          await dio.post('/v1/loan/sms/checkCodeByNoLogin', data: data);
      var _content = response.toString(); //todo 妈的，就是这里的问题，不能取 .data
      print("原始数据=" + _content);
      var jsonString = json.decode(_content);
      CodeBean codeBean = CodeBean.fromJson(jsonString);
      print("请求回来的数据codeBean=" + codeBean.toString());
      Toast.show(codeBean.toString(), context);
      setState(() {
        netResult = "codeBean=${codeBean.toString()}";
      });

      return codeBean;
    } catch (e) {
      print("请求回来的数据error=$e");
    }
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("widgt生命周期=deactivate");
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("widgt生命周期=initState");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("widgt生命周期=didChangeDependencies");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("widgt生命周期=dispose");
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("widgt生命周期=didUpdateWidget");
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
      '开始倒计时=$_seconds',
      style: TextStyle(fontSize: 17.0),
    );
  }

  /// 启动倒计时的计时器。
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      if (_seconds <= 1) {
        widget.onCountDownFinishCallBack(true, '倒计时马上要结束了');
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


class Clz {}
mixin A on Clz { //被混入的类必须是Clz的子类。 对混入类的约束。
  void a() {
    print('A');
  }
}

class Mix extends Clz with A {

}


