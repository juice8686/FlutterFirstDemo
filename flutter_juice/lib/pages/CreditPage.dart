import 'package:flutter/material.dart';
class CreditPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CreditPageState();
  }

}

class CreditPageState extends State<CreditPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.vertical, //横向列表
      children: <Widget>[
        // 垂直列表
        ListTile(
          leading: Image.network( //放置位置在前面
              "https://sucai.suoluomei.cn/sucai_zs/images/20200305110600-1.png"),
          trailing: Icon( //放置位置在后面
            Icons.search,
            color: Colors.green,
            size: 30,
          ),
          title: Text(
            "新闻标题新闻标题",
            style: TextStyle(fontSize: 24),
          ),
          subtitle: Text("二级标题二级标题"),
        ),

        // 垂直图文列表
        Image.network(
            "http://sucai.suoluomei.cn/sucai_zs/images/20200226173153-2.jpg"),
        Container(
          child: Text(
            "我是一个标题",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        ),

        Container(
          width: 180.0,
          height: 100.0,
          color: Colors.deepOrange,
        ),
        Container(
          width: 180.0,
          height: 100.0,
          color: Colors.deepOrangeAccent,
        ),
        Container(
          width: 180.0,
          height: 100.0,
          color: Colors.deepPurple,
        ),
      ],
    );
  }
}