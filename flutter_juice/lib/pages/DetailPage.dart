
import 'package:flutter/material.dart';
class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///无需指定MaterialApp，使用的是第一个页面的风格，可指定AppBar
    return Scaffold(
      appBar: AppBar(title: Text("第二个页面"),),
      body: Text("这是详情页!!!"),
    );
  }
}