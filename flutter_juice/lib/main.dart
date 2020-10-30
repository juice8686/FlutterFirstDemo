import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "页面一",

      ///该处需要去掉下面已经指定了第一个页面
//      home: new PageOneDetail(),

      ///注册路由表
      routes: {
        /// '/'是特殊地址，第一个页面
        "/": (context) => PageOneDetail(),
        "/pageTwo": (context) => PageTwo(),
      },
    );
  }
}

class PageOneDetail extends StatelessWidget {
  ///此处context为MaterialApp下的context
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("第一个页面"),),
      body: RaisedButton(onPressed: () async {
        ///获取第二个页面返回的数据 相当于Activity 的onActivityResult
        var pushNamed = await Navigator.pushNamed(context, "/pageTwo");
        debugPrint(pushNamed);
      }, child: Text("点我跳转"),),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("第二个页面"),),
        body: RaisedButton(onPressed: () {
          //路由pop弹出，结束页面
          Navigator.pop(context, "结束返回,请在第一个页面获取数据。。。");
        }, child: Text("我是第二个页面"),)

    );
  }
}



