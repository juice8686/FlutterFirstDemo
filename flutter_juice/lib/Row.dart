import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.grey,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Deliver features faster',
              textAlign: TextAlign.center,
            ),
            flex: 1,
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Craft beautiful UIs',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: FlutterLogo(),
            flex: 2,
          ),
          FlutterLogo(),
          FittedBox(
            fit: BoxFit.contain,
            child: FlutterLogo(),
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain,
              child: FlutterLogo(),
            ),
          )
        ],
      ),
    );
  }
}