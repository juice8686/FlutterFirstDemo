import 'package:flutter/material.dart';
class PayPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PayPageState();
  }

}

class PayPageState extends State<PayPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
       child: Text(
         '请还款',
         style: TextStyle(
             color: Colors.green),
       ),
    );
  }
}