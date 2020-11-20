https://github.com/juice8686/FlutterFirstDemo.git   项目地址
第一章：
Flutter 搭建流程
   1，下载flutter sdk
   2, 添加到环境变量
   3, android studio 下载flutter插件，dart插件。
   4, 中国设置特殊的环境   cmd命令
       set PUB_HOSTED_URL=https://pub.flutter-io.cn
       set FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

第二章：
Flutter 打包流程
第一步：签名
和设置android签名一样在Android项目目录下的build.gradle里面设置好签名。

第二步：执行打包命令

在flutter项目目录下执行下面的命令

打Release包：执行flutter build apk --release 或直接 flutter build apk(默认打release包)

打Debug包： 执行flutter build apk --debug


第三章：
flutter 与 原生交互的两个问题
项目默认引入是io.flutter.embedding.android.FlutterActivity，而不是io.flutter.app.FlutterActivity，采用中文网这个包，会造成各种问题，比如：编译不过、插件异常
中文网中的调用方法是写在onCreate中，而注册语句是GeneratedPluginRegistrant.registerWith(this)，这个是不生效的，实际上应该写在configureFlutterEngine中，不需要实现onCreate


第四章：
Flutter ,Android 原生集成到Flutter module开发。(半成品开发)

命令：flutter attach     实现集成式 热重载（双击r）

参考这篇文章 https://blog.csdn.net/I123456789T/article/details/89445713

不管是原生跳flutter,还是flutter跳原生，其实最后都是调用了原生的跳转方法。
前者，借助FlutterActivity+路由参数；后者则是借用通讯频道间接让原生自己跳转。


通过FlutterFragment引入Flutter编写的页面：通过flutterEngine 检索到router的flutter 页面（widget）