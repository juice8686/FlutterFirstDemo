import 'package:flutter/material.dart';
class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }

}

class HomeState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
       child: Text(
         'i am a home page!',
         style: TextStyle(
             color: Colors.green),
       ),
    );
  }
}