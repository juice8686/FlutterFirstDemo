import 'package:flutter/material.dart';
class MinePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MinePageState();
  }

}

class MinePageState extends State<MinePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
       child: Text(
         '这是我的页面',
         style: TextStyle(
             color: Colors.green),
       ),
    );
  }
}