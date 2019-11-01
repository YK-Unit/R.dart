import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:r_dart_library/assert_svg.dart';

/// This `R` class is generated and contains references to static resources.
class R {

  /// package name: flutter_r_demo
  static const package = "flutter_r_demo";

}   


/// Because dart does not support nested class, so use class `R_Image` to replace nested class `R.Image`
// ignore: camel_case_types
class R_Image {


	/// assert: "assets/images/ test blank.png"
	// ignore: non_constant_identifier_names
	static const a_test_blank = AssetImage("assets/images/ test blank.png", package: R.package);   


	/// assert: "assets/images/$$test$.png"
	// ignore: non_constant_identifier_names
	static const a$$test$ = AssetImage("assets/images/\$\$test\$.png", package: R.package);   


	/// assert: "assets/images/$test.png"
	// ignore: non_constant_identifier_names
	static const a$test = AssetImage("assets/images/\$test.png", package: R.package);   


	/// assert: "assets/images/User@white.png"
	// ignore: non_constant_identifier_names
	static const user_white = AssetImage("assets/images/User@white.png", package: R.package);   


	/// assert: "assets/images/body_check_done_human.png"
	// ignore: non_constant_identifier_names
	static const body_check_done_human = AssetImage("assets/images/body_check_done_human.png", package: R.package);   


	/// assert: "assets/images/body_checking_human.png"
	// ignore: non_constant_identifier_names
	static const body_checking_human = AssetImage("assets/images/body_checking_human.png", package: R.package);   


	/// assert: "assets/images/btn_cycle_down_80_H.png"
	// ignore: non_constant_identifier_names
	static const btn_cycle_down_80_H = AssetImage("assets/images/btn_cycle_down_80_H.png", package: R.package);   


	/// assert: "assets/images/btn_cycle_down_80_N.png"
	// ignore: non_constant_identifier_names
	static const btn_cycle_down_80_N = AssetImage("assets/images/btn_cycle_down_80_N.png", package: R.package);   


	/// assert: "assets/images/5number.png"
	// ignore: non_constant_identifier_names
	static const a5number = AssetImage("assets/images/5number.png", package: R.package);   


	/// assert: "assets/images/_test.png"
	// ignore: non_constant_identifier_names
	static const a_test = AssetImage("assets/images/_test.png", package: R.package);   


	/// assert: "assets/images/icon.ignoreme.png"
	// ignore: non_constant_identifier_names
	static const icon_ignoreme = AssetImage("assets/images/icon.ignoreme.png", package: R.package);   


	/// assert: "assets/images/sameName.gif"
	// ignore: non_constant_identifier_names
	static const sameName_gif = AssetImage("assets/images/sameName.gif", package: R.package);   


	/// assert: "assets/images/sameName.jpg"
	// ignore: non_constant_identifier_names
	static const sameName_jpg = AssetImage("assets/images/sameName.jpg", package: R.package);   


	/// assert: "assets/images/sameName.png"
	// ignore: non_constant_identifier_names
	static const sameName = AssetImage("assets/images/sameName.png", package: R.package);   


	/// assert: "assets/images/test.png"
	// ignore: non_constant_identifier_names
	static const test = AssetImage("assets/images/test.png", package: R.package);   


	/// assert: "assets/images/~!$test.png"
	// ignore: non_constant_identifier_names
	static const a__$test = AssetImage("assets/images/~!\$test.png", package: R.package);   


}   

/// Because dart does not support nested class, so use class `R_Svg` to replace nested class `R.Svg`
// ignore: camel_case_types
class R_Svg {


	/// assert: assets/images/$$test$.svg
	// ignore: non_constant_identifier_names
	static AssertSvg a$$test$({@required double width, @required double height}) {
		var assertFullPath = "packages/flutter_r_demo/assets/images/\$\$test\$.svg";
		var imageProvider = AssertSvg(assertFullPath, width: width, height: height);
		return imageProvider;
	}


	/// assert: assets/images/$test.svg
	// ignore: non_constant_identifier_names
	static AssertSvg a$test({@required double width, @required double height}) {
		var assertFullPath = "packages/flutter_r_demo/assets/images/\$test.svg";
		var imageProvider = AssertSvg(assertFullPath, width: width, height: height);
		return imageProvider;
	}


	/// assert: assets/images/_test.svg
	// ignore: non_constant_identifier_names
	static AssertSvg a_test({@required double width, @required double height}) {
		var assertFullPath = "packages/flutter_r_demo/assets/images/_test.svg";
		var imageProvider = AssertSvg(assertFullPath, width: width, height: height);
		return imageProvider;
	}


	/// assert: assets/images/manipulation_knead_N.svg
	// ignore: non_constant_identifier_names
	static AssertSvg manipulation_knead_N({@required double width, @required double height}) {
		var assertFullPath = "packages/flutter_r_demo/assets/images/manipulation_knead_N.svg";
		var imageProvider = AssertSvg(assertFullPath, width: width, height: height);
		return imageProvider;
	}


	/// assert: assets/images/manipulation_knead_S.svg
	// ignore: non_constant_identifier_names
	static AssertSvg manipulation_knead_S({@required double width, @required double height}) {
		var assertFullPath = "packages/flutter_r_demo/assets/images/manipulation_knead_S.svg";
		var imageProvider = AssertSvg(assertFullPath, width: width, height: height);
		return imageProvider;
	}


}   

/// Because dart does not support nested class, so use class `R_Json` to replace nested class `R.Json`
// ignore: camel_case_types
class R_Text {


	/// assert: assets/json/$$test$.json
	// ignore: non_constant_identifier_names
	static Future<String> a$$test$_json() {
		var assertFullPath = "packages/flutter_r_demo/assets/json/\$\$test\$.json";
		var str = rootBundle.loadString(assertFullPath);
		return str;
	}


	/// assert: assets/json/test.json
	// ignore: non_constant_identifier_names
	static Future<String> test_json() {
		var assertFullPath = "packages/flutter_r_demo/assets/json/test.json";
		var str = rootBundle.loadString(assertFullPath);
		return str;
	}


	/// assert: assets/yaml/$$test$.yaml
	// ignore: non_constant_identifier_names
	static Future<String> a$$test$_yaml() {
		var assertFullPath = "packages/flutter_r_demo/assets/yaml/\$\$test\$.yaml";
		var str = rootBundle.loadString(assertFullPath);
		return str;
	}


	/// assert: assets/yaml/test.yaml
	// ignore: non_constant_identifier_names
	static Future<String> test_yaml() {
		var assertFullPath = "packages/flutter_r_demo/assets/yaml/test.yaml";
		var str = rootBundle.loadString(assertFullPath);
		return str;
	}


}   
