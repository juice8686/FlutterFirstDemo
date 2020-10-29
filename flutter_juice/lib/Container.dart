import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return  Container(
  //     margin: EdgeInsets.all(50),
  //     color: Colors.blue,
  //     width: 50,
  //     height: 50,
  //     child: Container(
  //       margin: EdgeInsets.all(30),
  //       color: Colors.red,
  //     ),
  //   );

  @override
  Widget build(BuildContext context) {
    //定义一个redBox，只设置颜色，不指定宽高
    final Widget redBox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );
    return Container(
      margin: EdgeInsets.only(top: 40, left: 40, right: 40, bottom: 50),
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            Color(0xFF0D47A1),
            Color(0xFF1976D2),
            Color(0xFF42A5F5),
          ])),
      transform: Matrix4.rotationZ(0.1),
    );
  }
}