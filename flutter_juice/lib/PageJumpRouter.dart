import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(new MyApp());


class HomeData {
  const HomeData({this.title,this.routerName,this.content});

  final String title;
  final String content;
  final String routerName;
}

class HomePage extends StatefulWidget {
  final List<HomeData> homeDataList = [
    HomeData(
        title: 'HomePage',
        content: 'HomePage',
        routerName: 'home_page'),
  ];

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter实战教学'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: widget.homeDataList.map((HomeData homeData) {
          return HomeListItem(homeData: homeData);
        }).toList(),
      ),
    );
  }
}
class HomeListItem extends StatefulWidget {
  const HomeListItem({Key key, @required HomeData homeData})
      : homeData = homeData,
        super(key: key);
  final HomeData homeData;

  @override
  State<StatefulWidget> createState() {
    return HomeListItemState();
  }
}

class HomeListItemState extends State<HomeListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: RaisedButton(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              '${widget.homeData.title}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '${widget.homeData.content}',
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        onPressed: () {
          print('${widget.homeData.title}');
          if (widget.homeData.routerName != null &&
              widget.homeData.routerName.isNotEmpty) {
            Navigator.pushNamed(context, widget.homeData.routerName);
          }
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 应用程序小部件使用的颜色。
        primarySwatch: Colors.blue,
      ),
      //注册路由表
      routes: routerTable,
      home: HomePage(),
    );
  }
  final routerTable = {
    'home_page': (context) => HomePage(),
  };
}