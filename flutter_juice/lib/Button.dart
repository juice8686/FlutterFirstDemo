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
        body: ButtonPage(),
      ),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}


class ButtonPage extends StatelessWidget {
  const ButtonPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮演示页面"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('凸起按钮'),
                color: Colors.blue, //设置按钮颜色
                textColor: Colors.white, //设置文本颜色
                elevation: 5, //设置按钮阴影
                //设置按钮的圆角
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                splashColor: Colors.green, //长按水波纹的颜色
                onPressed: () {
                  print("执行事件");
                },
              ),
              RaisedButton.icon(
                icon: Icon(Icons.access_alarm),
                label: Text("图标按钮"),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("扁平化按钮"),
                color: Colors.orange,
                textColor: Colors.white,
                onPressed: () {
                  print("扁平化按钮");
                },
              ),
              OutlineButton(
                child: Text("线框按钮"),
                textColor: Colors.orange,
                onPressed: () {},
              ),
              //只有图标的按钮
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 50,
                width: 200,
                child: RaisedButton(
                  child: Text('设置按钮宽度高度'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  child: Text('自适应按钮'),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}








