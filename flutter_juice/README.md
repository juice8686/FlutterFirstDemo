https://github.com/juice8686/FlutterFirstDemo.git   项目地址

Flutter 搭建流程
   1，下载flutter sdk
   2, 添加到环境变量
   3, android studio 下载flutter插件，dart插件。
   4, 中国设置特殊的环境   cmd命令
       set PUB_HOSTED_URL=https://pub.flutter-io.cn
       set FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn


Flutter 打包流程
第一步：签名
和设置android签名一样在Android项目目录下的build.gradle里面设置好签名。

第二步：执行打包命令

在flutter项目目录下执行下面的命令

打Release包：执行flutter build apk --release 或直接 flutter build apk(默认打release包)

打Debug包： 执行flutter build apk --debug
