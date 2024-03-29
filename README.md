# DEPRECATED
现在研发了一个更好的管理Flutter资源的工具：[Flr(Flutter-R)](https://github.com/Fly-Mix/flr-cli)，故把当前项目废弃掉。

# About R.dart
`R.dart`项目旨在为Flutter开发者提供类似Android下的R方案的体验：其提供了一个脚本工具`R.generated.rb`，使Flutter开发者运行一个命令即可自动检索指定的APP资源目录，并对检索的APP资源进行代码外部化（ externalize app resources with code），最后生成`R`类（对应`R.dart`文件）供开发者在代码中通过资源ID（资源ID一般为资源的名称）来访问APP资源。



# `R.generated.rb` feature



- 支持配置检索的目录
- 支持图片资源（`.png`、 `.jpg`、 `.jpeg`、 `.gif`、 `.webp`、 `.icon`、 `.bmp`、 `.wbmp`、`.svg`）和文本资源（`.txt`、`.json`、`.yaml`、`.xml`）的检索和外部化
- 支持变体（variant）图片资源的外部化
- 支持名称首字符为数字的资源的外部化
- 支持名称含有特殊字符（如`~`、`!`、`@`、`#`等）的资源的外部化
- 支持类型不同但名称相同的资源的外部化



# How to use `R.generated.rb`

下面将会通过示例工程 [flutter_r_demo](https://github.com/YK-Unit/R.dart/tree/master/flutter_r_demo) 演示如何使用`R.generated.rb`工具：

1. 拷贝`R.generated.rb`和`R.config.yaml`到你的Flutter项目根目录：

   ![image-20191101174818234](README_Assets/copy_r.png)

2. 添加依赖包 [r_dart_Library](https://github.com/YK-Unit/r_dart_Library) 到你的Flutter项目中：

   ![image-20191101175142788](README_Assets/add_package.png)

   

   PS：由于还没有发布依赖包`r_dart_Library`到[pub.dev](https://pub.flutter-io.cn/)，故当前通过git的方式添加。

3. 根据你的Flutter项目资源放置情况，配置`R.config.yaml`：

   ![image-20191101175634180](README_Assets/update_r_config.png)

4. 在你的Flutter项目根目录执行命令：`ruby R.generated.rb`

   ![image-20191101175944606](README_Assets/run_r.png)

   

   这时候，在Flutter项目根目录的lib文件夹下，会多出一个`R.dart`文件：

   ![image-20191103220748817](README_Assets/r.dart.png)

   

   然后，开发者借助`R`类，即可在代码中通过资源ID来访问图片资源和文本资源：

   ```dart
   /// 访问一般图片资源
   var normalImageWidget = Image(
     width: 113,
     height: 128,
     image: R_Image.a_test_blank,
   );
   
   /// 访问SVG图片资源
   var svgImageWidget = Image(
     width: 100,
     height: 100,
     image: R_Svg.a$$test$(width: 100, height: 100),
   );
   
   /// 访问文本资源
   var rawString = await R_Text.a$$test$_json();
   
   ```

   

5. 若更新了（增删改）APP资源，则再次执行步骤4即可~



# TODO

1. 为脚本工具增加版本检测功能
2. 支持更多类型资源的检测和外部化
