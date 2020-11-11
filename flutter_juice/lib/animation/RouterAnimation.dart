import 'package:flutter/material.dart';
import 'package:flutter_juice/animation/AnimateWidgetDemo.dart';
import 'package:flutter_juice/animation/AnimatedPadding.dart';
import 'package:flutter_juice/animation/AnimatedCrossFadeDemo.dart';
import 'package:flutter_juice/animation/CurvedAnimation.dart';
import 'package:flutter_juice/animation/AnimationStatusDemo.dart';
import 'package:flutter_juice/animation/Debug.dart';
import 'package:flutter_juice/animation/FadeTransitionDemo.dart';
import 'package:flutter_juice/animation/GrowTransitionDemo.dart';
import 'package:flutter_juice/animation/MyStepperDemo.dart';
import 'package:flutter_juice/animation/PositionedTransitionDemo.dart';
import 'package:flutter_juice/animation/PositionedTransitionOfficalDemo.dart';
import 'package:flutter_juice/animation/RotationTransitionDemo.dart';
import 'package:flutter_juice/animation/ScaleTransitionDemo.dart';
import 'package:flutter_juice/animation/SizeTransitionDemo.dart';
import 'package:flutter_juice/animation/StaggerAnimation.dart';
import 'package:flutter_juice/animation/StepperDemo.dart';
import 'package:flutter_juice/animation/SwitchDemo.dart';
import 'package:flutter_juice/animation/TweenColorDemo.dart';
import 'package:flutter_juice/animation/WrapDemo.dart';
import 'package:flutter_juice/animation/drawer.dart';
/// 动画相关
class RouterAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Animation学习笔记"),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context,position){
            return   ListTile(
              title: Text(list[position].name),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder:list[position].builder));
              },
            );
          }
      ),
    );;
  }
}
class _RouterInfo {
  String name;
  WidgetBuilder builder;
  _RouterInfo({this.name, this.builder});
}

final List<_RouterInfo> list = <_RouterInfo>[
  _RouterInfo(name: "Tween的简单使用", builder: (context) => ScaleImageDemo()),
  _RouterInfo(name: "ColorTween的简单使用", builder: (context) => TweenColorDemo()),
  _RouterInfo(name: "CurvedAnimation的简单使用", builder: (context) => CurvedScaleImageDemo()),
  _RouterInfo(name: "AnimatedWidget的简单使用", builder: (context) => AnimatedWidgetDemo()),
  _RouterInfo(name: "AnimatedBuilder的简单应用", builder: (context) => GrowTransitionDemo()),
  _RouterInfo(name: "组合动画的简单使用", builder: (context) => StaggerDemo()),
  _RouterInfo(name: "PositionTransaction的简单使用", builder: (context) => PTDemo()),
  _RouterInfo(name: "RelativeRectTween的简单应用", builder: (context) => BackdropDemo()),
  _RouterInfo(name: "PositionTransaction官方api例子实现", builder: (context) => PTDemo2()),
  _RouterInfo(name: "RotationTransition的简单使用", builder: (context) => RTDemo()),
  _RouterInfo(name: "FadeTransition的简单使用", builder: (context) => FTDemo()),
  _RouterInfo(name: "AnimatedCrossFade的简单使用", builder: (context) => AnimatedCrossFadeDemo()),
  _RouterInfo(name: "ScaleTransition的简单使用", builder: (context) => ScaleTDemo()),
  _RouterInfo(name: "SizeTransition的简单使用", builder: (context) => SizeTDemo()),
  _RouterInfo(name: "AnimatedPadding简单使用", builder: (context) => APDemo()),
];
