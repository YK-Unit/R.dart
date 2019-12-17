import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:r_dart_library/asset_svg.dart';

/// This `R` class is generated and contains references to static resources.
class R {

  /// package name: flutter_r_demo
  static const package = "flutter_r_demo";

}   


/// Because dart does not support nested class, so use class `R_Image` to replace nested class `R.Image`
// ignore: camel_case_types
class R_Image {


	/// asset: "assets/images/ test blank.png"
	// ignore: non_constant_identifier_names
	static const a_test_blank = AssetImage("assets/images/ test blank.png", package: R.package);   


	/// asset: "assets/images/$$test$.png"
	// ignore: non_constant_identifier_names
	static const a$$test$ = AssetImage("assets/images/\$\$test\$.png", package: R.package);   


	/// asset: "assets/images/$test.png"
	// ignore: non_constant_identifier_names
	static const a$test = AssetImage("assets/images/\$test.png", package: R.package);   


	/// asset: "assets/images/User@white.png"
	// ignore: non_constant_identifier_names
	static const user_white = AssetImage("assets/images/User@white.png", package: R.package);   


	/// asset: "assets/images/body_check_done_human.png"
	// ignore: non_constant_identifier_names
	static const body_check_done_human = AssetImage("assets/images/body_check_done_human.png", package: R.package);   


	/// asset: "assets/images/body_checking_human.png"
	// ignore: non_constant_identifier_names
	static const body_checking_human = AssetImage("assets/images/body_checking_human.png", package: R.package);   


	/// asset: "assets/images/btn_cycle_down_80_H.png"
	// ignore: non_constant_identifier_names
	static const btn_cycle_down_80_H = AssetImage("assets/images/btn_cycle_down_80_H.png", package: R.package);   


	/// asset: "assets/images/btn_cycle_down_80_N.png"
	// ignore: non_constant_identifier_names
	static const btn_cycle_down_80_N = AssetImage("assets/images/btn_cycle_down_80_N.png", package: R.package);   


	/// asset: "assets/images/5number.png"
	// ignore: non_constant_identifier_names
	static const a5number = AssetImage("assets/images/5number.png", package: R.package);   


	/// asset: "assets/images/_test.png"
	// ignore: non_constant_identifier_names
	static const a_test = AssetImage("assets/images/_test.png", package: R.package);   


	/// asset: "assets/images/icon.ignoreme.png"
	// ignore: non_constant_identifier_names
	static const icon_ignoreme = AssetImage("assets/images/icon.ignoreme.png", package: R.package);   


	/// asset: "assets/images/sameName.gif"
	// ignore: non_constant_identifier_names
	static const sameName_gif = AssetImage("assets/images/sameName.gif", package: R.package);   


	/// asset: "assets/images/sameName.jpg"
	// ignore: non_constant_identifier_names
	static const sameName_jpg = AssetImage("assets/images/sameName.jpg", package: R.package);   


	/// asset: "assets/images/sameName.png"
	// ignore: non_constant_identifier_names
	static const sameName = AssetImage("assets/images/sameName.png", package: R.package);   


	/// asset: "assets/images/test.png"
	// ignore: non_constant_identifier_names
	static const test = AssetImage("assets/images/test.png", package: R.package);   


	/// asset: "assets/images/~!$test.png"
	// ignore: non_constant_identifier_names
	static const a__$test = AssetImage("assets/images/~!\$test.png", package: R.package);   


}   

/// Because dart does not support nested class, so use class `R_Svg` to replace nested class `R.Svg`
// ignore: camel_case_types
class R_Svg {


	/// asset: assets/images/$$test$.svg
	// ignore: non_constant_identifier_names
	static AssetSvg a$$test$({@required double width, @required double height}) {
		var assetFullPath = "packages/flutter_r_demo/assets/images/\$\$test\$.svg";
		var imageProvider = AssetSvg(assetFullPath, width: width, height: height);
		return imageProvider;
	}


	/// asset: assets/images/$test.svg
	// ignore: non_constant_identifier_names
	static AssetSvg a$test({@required double width, @required double height}) {
		var assetFullPath = "packages/flutter_r_demo/assets/images/\$test.svg";
		var imageProvider = AssetSvg(assetFullPath, width: width, height: height);
		return imageProvider;
	}


	/// asset: assets/images/_test.svg
	// ignore: non_constant_identifier_names
	static AssetSvg a_test({@required double width, @required double height}) {
		var assetFullPath = "packages/flutter_r_demo/assets/images/_test.svg";
		var imageProvider = AssetSvg(assetFullPath, width: width, height: height);
		return imageProvider;
	}


	/// asset: assets/images/manipulation_knead_N.svg
	// ignore: non_constant_identifier_names
	static AssetSvg manipulation_knead_N({@required double width, @required double height}) {
		var assetFullPath = "packages/flutter_r_demo/assets/images/manipulation_knead_N.svg";
		var imageProvider = AssetSvg(assetFullPath, width: width, height: height);
		return imageProvider;
	}


	/// asset: assets/images/manipulation_knead_S.svg
	// ignore: non_constant_identifier_names
	static AssetSvg manipulation_knead_S({@required double width, @required double height}) {
		var assetFullPath = "packages/flutter_r_demo/assets/images/manipulation_knead_S.svg";
		var imageProvider = AssetSvg(assetFullPath, width: width, height: height);
		return imageProvider;
	}


}   

/// Because dart does not support nested class, so use class `R_Json` to replace nested class `R.Json`
// ignore: camel_case_types
class R_Text {


	/// asset: assets/jsons/$$test$.json
	// ignore: non_constant_identifier_names
	static Future<String> a$$test$_json() {
		var assetFullPath = "packages/flutter_r_demo/assets/jsons/\$\$test\$.json";
		var str = rootBundle.loadString(assetFullPath);
		return str;
	}


	/// asset: assets/jsons/test.json
	// ignore: non_constant_identifier_names
	static Future<String> test_json() {
		var assetFullPath = "packages/flutter_r_demo/assets/jsons/test.json";
		var str = rootBundle.loadString(assetFullPath);
		return str;
	}


	/// asset: assets/yamls/$$test$.yaml
	// ignore: non_constant_identifier_names
	static Future<String> a$$test$_yaml() {
		var assetFullPath = "packages/flutter_r_demo/assets/yamls/\$\$test\$.yaml";
		var str = rootBundle.loadString(assetFullPath);
		return str;
	}


	/// asset: assets/yamls/test.yaml
	// ignore: non_constant_identifier_names
	static Future<String> test_yaml() {
		var assetFullPath = "packages/flutter_r_demo/assets/yamls/test.yaml";
		var str = rootBundle.loadString(assetFullPath);
		return str;
	}


}   
