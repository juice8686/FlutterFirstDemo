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

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: GridView.count(
        childAspectRatio: 1.7, //宽高比例
        crossAxisCount: 2, //一行有多少个组件
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.network(
                'http://sucai.suoluomei.cn/sucai_zs/images/20200226173152-1.jpg',
                fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.network(
                'http://sucai.suoluomei.cn/sucai_zs/images/20200226173152-1.jpg',
                fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.network(
                'http://sucai.suoluomei.cn/sucai_zs/images/20200226173152-1.jpg',
                fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}


