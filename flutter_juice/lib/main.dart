import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() =>  runApp(new Nice());

class Nice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imageUrl = 'https://dss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/topnav/tupian@2x-482fc011fc.png';
    return Container(
      width: double.infinity,
      height: 100,
      child: Image(
        image: NetworkImage(imageUrl),
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
    //
    //
    //
    // @override
  // Widget build(BuildContext context) {
  //   var imageUrl='https://dss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/topnav/tupian@2x-482fc011fc.png';
  //   return  Container(
  //     color: Colors.grey,
  //     margin: EdgeInsets.only(top: 10, bottom: 10),
  //     padding: EdgeInsets.all(10),
  //     child: Column(
  //       children: [
  //         Container(
  //           width: double.infinity,
  //           height: 100,
  //           child: Image(
  //             image: NetworkImage(imageUrl),
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //         Container(
  //           width: double.infinity,
  //           height: 100,
  //           child: Image(
  //             image: NetworkImage(imageUrl),
  //             fit: BoxFit.fill,
  //           ),
  //         ),
  //         Container(
  //           width: double.infinity,
  //           height: 100,
  //           child: Image(
  //             image: NetworkImage(imageUrl),
  //             fit: BoxFit.contain,
  //           ),
  //         ),
  //         Container(
  //           width: double.infinity,
  //           height: 100,
  //           child: Image(
  //             image: NetworkImage(imageUrl),
  //             fit: BoxFit.scaleDown,
  //           ),
  //         ),
  //         Container(
  //           width: double.infinity,
  //           height: 100,
  //           child: Image(
  //             image: NetworkImage(imageUrl),
  //             fit: BoxFit.fitHeight,
  //           ),
  //         ),
  //         Container(
  //           width: double.infinity,
  //           height: 100,
  //           child: Image(
  //             image: NetworkImage(imageUrl),
  //             fit: BoxFit.fitWidth,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }