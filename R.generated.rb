#!/usr/bin/ruby
require 'yaml'
require 'find'

# --- TODO：版本检测相关 ---

# 检测当前脚本是不是最新的
version = "0.1.0"

# --- 具体工程配置相关 ---

# 工程的根目录
root_dir = Dir.pwd
# puts "root_dir: #{root_dir}"

# --- “R.config.yaml” 相关 ---
# “R.config.yaml”的路径
r_config_path = "#{root_dir}/R.config.yaml"
# “R.config.yaml”的内容
r_config_yaml = YAML.load(File.open(r_config_path))


image_assert_dir_paths = r_config_yaml["assets"]["images"]
text_assert_dir_paths = r_config_yaml["assets"]["texts"]
assert_dir_paths = []

if image_assert_dir_paths.is_a?(Array) 
	assert_dir_paths = assert_dir_paths + image_assert_dir_paths
end

if text_assert_dir_paths.is_a?(Array)
	assert_dir_paths = assert_dir_paths + text_assert_dir_paths
end

assert_dir_paths = assert_dir_paths.uniq

# puts "assert_dir_paths: #{assert_dir_paths}"


# 需要过滤的资源
# .DS_Store 是 macOS 下文件夹里默认自带的的隐藏文件
ignored_asset_basenames = [".DS_Store"]


# --- “pubspec.yaml” 相关 ---

# 函数功能：遍历指定资源文件夹下所有文件（包括子文件夹），返回资源的依赖说明数组，如
# ["packages/flutter_demo/assets/images/hot_foot_N.png", "packages/flutter_demo/assets/images/hot_foot_S.png"]
def get_asserts_in_dir (assert_dir_path, ignored_asset_basenames, package_name)
	assert_dir_name = assert_dir_path.split("lib/")[1]
	assets = []
	Find.find(assert_dir_path) do |path|
	  if File.file?(path)
	    file_basename = File.basename(path)

	    if ignored_asset_basenames.include?(file_basename)
	      next
	    end

	    assert = "packages/#{package_name}/#{assert_dir_name}/#{file_basename}"
	    assets << assert
	  end
	end
	uniq_assets = assets.uniq
	return uniq_assets
end 

puts "update flutter assets config of pubspec.yaml now ..."

# 依赖说明文件“pubspec.yaml”相关配置
# “pubspec.yaml”的路径
pubspec_path = "#{root_dir}/pubspec.yaml"
# “pubspec.yaml”的内容
pubspec_yaml = YAML.load(File.open(pubspec_path))
package_name = pubspec_yaml["name"]

flutter_assets = []
assert_dir_paths.each do |assert_dir_path|
	specified_assets = get_asserts_in_dir(assert_dir_path, ignored_asset_basenames, package_name)
	flutter_assets = flutter_assets + specified_assets
end 

uniq_flutter_assets = flutter_assets.uniq
pubspec_yaml["flutter"]["assets"] = uniq_flutter_assets

# 覆盖更新“pubspec.yaml”内容
f = File.open(pubspec_path, 'w')
f.write pubspec_yaml.to_yaml
f.close

puts "update flutter assets config of pubspec.yaml done !!!"


# --- “R.dart” 相关 ---

# 专有名词解释：
# asset example: packages/flutter_demo/assets/images/hot_foot_N.png 
# file_basename example: hot_foot_N.png
# asset_basename example: hot_foot_N
# file_extname example: .png
# assert_dir_name example: assets/images

# 生成合法的asset_basename
def get_legalize_asset_basename (illegal_asset_basename)
	# 过滤非法字符
	asset_basename = illegal_asset_basename.gsub(/[^0-9A-Za-z_$]/, "_")

	# 首字母转化为小写
	capital = asset_basename[0].downcase
	asset_basename[0] = capital

	# 检测首字符是不是数字、_、$，若是则添加前缀字符"a"
	if capital =~ /[0-9_$]/
		asset_basename = "a" + asset_basename
	end

	return asset_basename
end

puts "generate R.generated.dart now ..."

# 管理静态资源类“R.generated.dart”的相关配置
# “R.generated.dart”的路径 
r_generated_path = "#{root_dir}/lib/R.dart"
# “R.generated.dart”的内容
r_generated_dart = File.open(r_generated_path,"w")

# 生成"class R"的代码
r_declaration = <<-HEREDOC
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:r_dart_library/assert_svg.dart';

/// This `R` class is generated and contains references to static resources.
class R {

  /// package name: #{package_name}
  static const package = "#{package_name}";

}   

HEREDOC
r_generated_dart.puts r_declaration

# 生成"class R_Image"的代码
r_image_declaration_header = <<-HEREDOC

/// Because dart does not support nested class, so use class `R_Image` to replace nested class `R.Image`
// ignore: camel_case_types
class R_Image {

HEREDOC
r_generated_dart.puts r_image_declaration_header


supported_asset_images = [".png", ".jpg", ".jpeg", ".gif", ".webp", ".icon", ".bmp", ".wbmp"]
# 根据遍历得到的静态资源数组，生成对应变量声明，写入到“R.dart”中
uniq_flutter_assets.each do |asset|
	# asset example: packages/flutter_demo/assets/images/hot_foot_N.png 
	# file_basename example: hot_foot_N.png
	# asset_basename example: hot_foot_N
	# assert_dir_name example: assets/images

	file_extname = File.extname(asset).downcase

	# 如果当前不是支持的图片资源，则跳过
	unless supported_asset_images.include?(file_extname) 
		next
	end

	file_basename = File.basename(asset)

	asset_basename = File.basename(asset, ".*")
	if file_extname.eql?(".png") == false
		extinfo = file_extname
		extinfo[0] = "_"
		asset_basename = asset_basename + extinfo
	end 
	asset_basename = get_legalize_asset_basename(asset_basename)


	assert_dir_name = asset.dup
	assert_dir_name["packages/#{package_name}/"] = ""
	assert_dir_name["/#{file_basename}"] = ""

	param_file_basename = file_basename.gsub(/[$]/, "\\$")
	param_assetName = "#{assert_dir_name}/#{param_file_basename}"

	assert_declaration = <<-HEREDOC

	/// assert: "#{assert_dir_name}/#{file_basename}"
	// ignore: non_constant_identifier_names
	static const #{asset_basename} = AssetImage("#{param_assetName}", package: R.package);   

	HEREDOC

	r_generated_dart.puts assert_declaration

end

r_image_declaration_footer = <<-HEREDOC

}   
HEREDOC
r_generated_dart.puts r_image_declaration_footer


# 生成"class R_Svg"的代码
r_svg_declaration_header = <<-HEREDOC

/// Because dart does not support nested class, so use class `R_Svg` to replace nested class `R.Svg`
// ignore: camel_case_types
class R_Svg {

HEREDOC
r_generated_dart.puts r_svg_declaration_header

# 根据遍历得到的静态资源数组，生成对应变量声明，写入到“R.dart”中
uniq_flutter_assets.each do |asset|
	
	file_extname = File.extname(asset).downcase

	# 如果当前不是支持的图片资源，则跳过
	unless file_extname.eql?(".svg")  
		next
	end

	file_basename = File.basename(asset)

	asset_basename = File.basename(asset, ".*")
	asset_basename = get_legalize_asset_basename(asset_basename)

	assert_dir_name = asset.dup
	assert_dir_name["packages/#{package_name}/"] = ""
	assert_dir_name["/#{file_basename}"] = ""

	param_asset = asset.dup
	param_asset = param_asset.gsub(/[$]/, "\\$")

	assert_declaration = <<-HEREDOC

	/// assert: #{assert_dir_name}/#{file_basename}
	// ignore: non_constant_identifier_names
	static AssertSvg #{asset_basename}({@required double width, @required double height}) {
		var assertFullPath = "#{param_asset}";
		var imageProvider = AssertSvg(assertFullPath, width: width, height: height);
		return imageProvider;
	}

	HEREDOC

	r_generated_dart.puts assert_declaration

end

r_svg_declaration_footer = <<-HEREDOC

}   
HEREDOC
r_generated_dart.puts r_svg_declaration_footer

# 生成"class R_Json"的代码
r_json_declaration_header = <<-HEREDOC

/// Because dart does not support nested class, so use class `R_Json` to replace nested class `R.Json`
// ignore: camel_case_types
class R_Text {

HEREDOC
r_generated_dart.puts r_json_declaration_header

supported_asset_txts = [".txt", ".json", ".yaml", ".xml"]
# 根据遍历得到的静态资源数组，生成对应变量声明，写入到“R.dart”中
uniq_flutter_assets.each do |asset|
	
	file_extname = File.extname(asset).downcase

	# 如果当前不是支持的文本资源，则跳过
	unless supported_asset_txts.include?(file_extname) 
		next
	end

	file_basename = File.basename(asset)

	asset_basename = File.basename(asset, ".*")
	extinfo = file_extname
	extinfo[0] = "_"
	asset_basename = asset_basename + extinfo
	asset_basename = get_legalize_asset_basename(asset_basename)

	assert_dir_name = asset.dup
	assert_dir_name["packages/#{package_name}/"] = ""
	assert_dir_name["/#{file_basename}"] = ""

	param_asset = asset.dup
	param_asset = param_asset.gsub(/[$]/, "\\$")

	assert_declaration = <<-HEREDOC

	/// assert: #{assert_dir_name}/#{file_basename}
	// ignore: non_constant_identifier_names
	static Future<String> #{asset_basename}() {
		var assertFullPath = "#{param_asset}";
		var str = rootBundle.loadString(assertFullPath);
		return str;
	}

	HEREDOC

	r_generated_dart.puts assert_declaration

end

r_json_declaration_footer = <<-HEREDOC

}   
HEREDOC
r_generated_dart.puts r_json_declaration_footer


r_generated_dart.close
puts "generate R.generated.dart done !!!"


# --- “flutter pub get” 相关 ---

puts "get flutter pub now ..."

get_flutter_pub_cmd = "flutter pub get"
system(get_flutter_pub_cmd)

puts "get flutter pub done !!!"

# --- end ---

puts "now you can have a flutter travel, and enjoy yourself 🎉🎉🎉"


