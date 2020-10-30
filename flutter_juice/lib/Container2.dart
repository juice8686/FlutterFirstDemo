import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() =>  runApp(new Nice());

class Nice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('首页'),
        ),
        body: HomeContent(),
      ),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        child: Text(
          '我是一个类似div组件',
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textScaleFactor: 2,
          style: TextStyle(
              fontSize: 16.0, //字体大小
              color: Colors.red, //字体颜色
              fontWeight: FontWeight.w500, //加粗
              fontStyle: FontStyle.italic, //斜体
              decoration: TextDecoration.lineThrough, //删除线
              decorationColor: Colors.grey, //中间删除线颜色
              decorationStyle: TextDecorationStyle.dashed, //中间删除线为虚线
              letterSpacing: 5.0 //文字间隔
          ),
        ),
        height: 300.0,
        width: 300.0,
        decoration: BoxDecoration(
          //绘制盒子的方法
          color: Colors.yellow,
          border: Border.all(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        // padding: EdgeInsets.fromLTRB(10, 30, 5, 0),
        padding: EdgeInsets.all(20), //内边距
        margin: EdgeInsets.fromLTRB(10, 30, 5, 0), //外边距
        // transform: Matrix4.translationValues(100, 0, 0),
        // transform: Matrix4.rotationZ(0.3),
        alignment: Alignment.bottomLeft,
      ),
    );
  }
}