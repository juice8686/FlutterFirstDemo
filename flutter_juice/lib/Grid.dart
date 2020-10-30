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
  List<Widget> _getListData() {
    var tempList = listData.map((value) {
      return Container(
        child: Column(
          children: <Widget>[
            Image.network(value['imageUrl']),
            SizedBox(height: 10),
            Text(
              value['title'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        decoration: BoxDecoration(
            border: Border.all(
                color: Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      crossAxisSpacing: 10.0, //横向之间的距离
      mainAxisSpacing: 10.0, //纵向之间的距离
      padding: EdgeInsets.all(10),
      // childAspectRatio: 0.7, //宽高比例
      crossAxisCount: 2, //一行有多少个组件
      children: this._getListData(),
    );
  }
}


