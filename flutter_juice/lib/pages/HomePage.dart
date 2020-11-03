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
    return Center(
      child: Container(
        // 圆形图片
        child: ClipOval(
            child: Image.network(
              'https://sucai.suoluomei.cn/sucai_zs/images/20200215152501-1.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            )),
        // 另一张圆形图片的处理方法
        // child: Image.network(
        //   "https://sucai.suoluomei.cn/sucai_zs/images/20200226173152-1.jpg",
        //   alignment: Alignment.bottomRight,
        //   color: Colors.grey,
        //   colorBlendMode: BlendMode.screen,
        //   fit: BoxFit.cover,
        //   // repeat: ImageRepeat.repeatY,
        // ),
        height: 300.0,
        width: 300.0,
      ),
    );
  }
}