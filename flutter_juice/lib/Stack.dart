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


// 自定义Json数据
List listData = [
  {
    "title": "模拟Json数据1",
    "author": "Dart",
    "imageUrl": "http://sucai.suoluomei.cn/sucai_zs/images/20200226173153-2.jpg"
  },
  {
    "title": "模拟Json数据2",
    "author": "Dart",
    "imageUrl": "http://sucai.suoluomei.cn/sucai_zs/images/20200226173153-2.jpg"
  },
  {
    "title": "模拟Json数据3",
    "author": "Dart",
    "imageUrl": "http://sucai.suoluomei.cn/sucai_zs/images/20200226173153-2.jpg"
  },
];

//帧布局 可以叠加
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 300,
        color: Colors.green,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 50,
              left: 50,
              child: Icon(Icons.search, size: 40, color: Colors.white),
            ),
            Align(
              alignment: Alignment(0, 0),
              child: Icon(Icons.home, size: 40, color: Colors.white),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.send, size: 40, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}




