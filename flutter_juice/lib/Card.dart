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
    return ListView(
      children: listData.map((value) {
        return Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  value["imageUrl"],
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(value["imageUrl"]),
                ),
                title: Text(value["title"]),
                subtitle: Text(
                  value["description"],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}





