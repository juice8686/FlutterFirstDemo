import 'package:flutter/material.dart';

///页面跳转
void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "第一个页面",
      home: Builder(builder: buildScaffold), //Builder添加后才能跳转成功
    ); //MaterialApp
  }
}

///创建一个widget
Widget buildScaffold(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("第一个页面"),),
    body: RaisedButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return new SecondPage();
      }));
    }, child: Text("点击跳转第二个页面"),),
  ); //Scaffo
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///无需指定MaterialApp，使用的是第一个页面的风格，可指定AppBar
    return Scaffold(
      appBar: AppBar(title: Text("第二个页面"),),
      body: Text("第二个页面"),
    );
  }
}

