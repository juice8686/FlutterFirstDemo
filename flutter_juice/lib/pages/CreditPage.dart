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
    return new Center(
       child: Text(
         'i am a credit page! oh yeah',
         style: TextStyle(
             color: Colors.green),
       ),
    );
  }
}