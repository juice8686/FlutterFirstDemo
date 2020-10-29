// import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final wordPair = WordPair.random();
//     return MaterialApp(
//       title: 'Welcome to Flutter',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('欢迎来南'),
//         ),
//         body: Center(
//           // child: Text(wordPair.asPascalCase),
//           child: RandomWords(),
//         ),
//       ),
//     );
//   }
// }
//
// class RandomWords extends StatefulWidget {
//   @override
//   _RandomWordsState createState() => _RandomWordsState();
// }
//
// // class _RandomWordsState extends State<RandomWords> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container();
// //   }
// // }
//
// class _RandomWordsState extends State<RandomWords> {
//   @override
//   Widget build(BuildContext context) {
//     final wordPair = WordPair.random();
//     return Text(wordPair.asPascalCase);
//   }
// }
//
//
//
// import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';
//
// void main() => runApp(MyApp());

// #docregion MyApp
// class MyApp extends StatelessWidget {
//   // #docregion build
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Startup Name Generator',
//       home: RandomWords(),
//     );
//   }
// // #enddocregion build
// }
// // #enddocregion MyApp
//
// // #docregion RWS-var
// class _RandomWordsState extends State<RandomWords> {
//   final _suggestions = <WordPair>[];
//   final _biggerFont = TextStyle(fontSize: 18.0);
//   // #enddocregion RWS-var
//
//   // #docregion _buildSuggestions
//   Widget _buildSuggestions() {
//     return ListView.builder(
//         padding: EdgeInsets.all(16.0),
//         itemBuilder: /*1*/ (context, i) {
//           if (i.isOdd) return Divider(); /*2*/
//
//           final index = i ~/ 2; /*3*/
//           if (index >= _suggestions.length) {
//             _suggestions.addAll(generateWordPairs().take(10)); /*4*/
//           }
//           return _buildRow(_suggestions[index]);
//         });
//   }
//   // #enddocregion _buildSuggestions
//
//   // #docregion _buildRow
//   Widget _buildRow(WordPair pair) {
//     return ListTile(
//       title: Text(
//         pair.asPascalCase,
//         style: _biggerFont,
//       ),
//     );
//   }
//   // #enddocregion _buildRow
//
//   // #docregion RWS-build
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Startup Name Generator'),
//       ),
//       body: _buildSuggestions(),
//     );
//   }
// // #enddocregion RWS-build
// // #docregion RWS-var
// }
// // #enddocregion RWS-var
//
// class RandomWords extends StatefulWidget {
//   @override
//   State<RandomWords> createState() => _RandomWordsState();
// }
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return  Container(
  //     margin: EdgeInsets.all(50),
  //     color: Colors.blue,
  //     width: 50,
  //     height: 50,
  //     child: Container(
  //       margin: EdgeInsets.all(30),
  //       color: Colors.red,
  //     ),
  //   );

  @override
  Widget build(BuildContext context) {
    //定义一个redBox，只设置颜色，不指定宽高
    final Widget redBox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );
    return Container(
      margin: EdgeInsets.only(top: 40, left: 40, right: 40, bottom: 50),
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            Color(0xFF0D47A1),
            Color(0xFF1976D2),
            Color(0xFF42A5F5),
          ])),
      transform: Matrix4.rotationZ(0.1),
    );
  }
}
