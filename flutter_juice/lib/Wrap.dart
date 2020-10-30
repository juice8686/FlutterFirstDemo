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

List listData = [
  {
    "title": "Candy 11",
    "author": "Motolora",
    "imageUrl":
    "http://sucai.suoluomei.cn/sucai_zs/images/20200226173152-1.jpg",
    "description":
    "Flutter is very goodFlutter is very goodFlutter is very goodFlutter is very goodFlutter is very goodFlutter is very goodFlutter is very good",
  },
  {
    "title": "Candy 22",
    "author": "Motolora",
    "imageUrl":
    "http://sucai.suoluomei.cn/sucai_zs/images/20200226173152-1.jpg",
    "description": "Flutter is very good",
  },
];

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 600,
      color: Colors.grey,
      child: Wrap(
        spacing: 10, //横轴之间的间距
        runSpacing: 10, //纵轴之间的间距
        // alignment: WrapAlignment.spaceEvenly,
        runAlignment: WrapAlignment.start,
        children: <Widget>[
          MyButton("斗罗大陆"),
          MyButton("少年歌行"),
          MyButton("百变小樱魔术卡"),
          MyButton("进击的巨人"),
          MyButton("神龙斗士"),
          MyButton("数码宝贝"),
          MyButton("海贼王"),
          MyButton("火影忍者"),
          MyButton("垃圾"),
        ],
      ),
    );
  }
}

// 封装button组件
class MyButton extends StatelessWidget {
  final String text;
  const MyButton(this.text, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text(this.text),
      textColor: Theme.of(context).accentColor,
      onPressed: () {
      },
    );
  }
}







