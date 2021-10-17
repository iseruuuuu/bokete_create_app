import 'dart:io';

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_editor/image_editor.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  ImageProvider? image;
  BlendMode blendMode = BlendMode.srcOver;
  File? _selectedImage;

  @override
  void onInit() {
    super.onInit();
    // Future.delayed(Duration.zero, () {
    //   _selectedImage = ModalRoute.of(context).settings.arguments;
    //   image = MemoryImage(_selectedImage?.readAsBytesSync());
    //   //setState(() {});
    // });
  }

  // Future<void> mixImage(
  //     BuildContext context, File srcImg, TapDownDetails details) async {
  //   final Uint8List src = srcImg.readAsBytesSync();
  //   final Uint8List material = await loadFromAsset(ImgPaths.SUNGLASS_PNG);
  //   final ImageEditorOption optionGroup = ImageEditorOption();
  //
  //   final Image img = Image.file(srcImg);
  //   print('${img.width.toString()}, ${img.height.toString()}');
  //
  //   RenderBox getBox = context.findRenderObject();
  //
  //   var localPos = getBox.globalToLocal(details.globalPosition);
  //   int x = localPos.dx.toInt();
  //   int y = localPos.dy.toInt();
  //
  //   print("$x,$y");
  //
  //   optionGroup.outputFormat = const OutputFormat.png();
  //   optionGroup.addOption(
  //     MixImageOption(
  //       x: x,
  //       y: y,
  //       width: 150,
  //       height: 150,
  //       target: MemoryImageSource(material),
  //       blendMode: blendMode,
  //     ),
  //   );
  //   final Uint8List? result =
  //   await ImageEditor.editImage(image: src, imageEditorOption: optionGroup);
  //   image = MemoryImage(result!);
  //   //setState(() {});
  // }

  Future<Uint8List> loadFromAsset(String key) async {
    final ByteData byteData = await rootBundle.load(key);
    return byteData.buffer.asUint8List();
  }

  //文字の反映をする
  void onSetWord() {}

  //画像の保存
  void onImageStore() {}
}
