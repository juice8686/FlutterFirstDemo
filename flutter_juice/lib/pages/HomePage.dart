import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_juice/net/NetManager.dart';
import 'package:toast/toast.dart';
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
          ],
        )
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

// dio.interceptors.add(InterceptorsWrapper(
//     onRequest: (RequestOptions options){
//       print("\n================== 请求数据 ==========================");
//       print("url = ${options.uri.toString()}");
//       print("headers = ${options.headers}");
//       print("params = ${options.data}");
//     },
//     onResponse: (Response response){
//       print("\n================== 响应数据 ==========================");
//       print("code = ${response.statusCode}");
//       print("data = ${response.data}");
//       print("\n");
//     },
//     onError: (DioError e){
//       print("\n================== 错误响应数据 ======================");
//       print("type = ${e.type}");
//       print("message = ${e.message}");
//       print("stackTrace = ${e.stackTrace}");
//       print("\n");
//     }
// ));
}
