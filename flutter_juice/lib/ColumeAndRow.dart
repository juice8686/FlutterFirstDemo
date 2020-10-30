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
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 180,
                color: Colors.blueGrey,
                child: Text('hello World'),
              ),
            ),

            Expanded(
              child: Container(
                height: 180,
                color: Colors.green,
                child: Text('hennice 啊'),
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
}



