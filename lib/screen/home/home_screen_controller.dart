import 'dart:io';
import 'dart:typed_data';
import 'package:bokete_create_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_editor/image_editor.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final textOption = AddTextOption();
  final editOption = ImageEditorOption();
  final textController = TextEditingController();
  final images = Assets.images.background.image();
  var title = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<Uint8List?> onEditImage() async {
    final ByteData bytes = await rootBundle.load(images.toString());
    final Uint8List list = bytes.buffer.asUint8List();
  }

  /*
  static Future<Uint8List?> editImage({
    required Uint8List image,
    required ImageEditorOption imageEditorOption,
   */
  //TODO image  -> Uint8List

//   static Future<Uint8List?> onLoadImage {
//
//     return rootBundle.load(images).buffer.asUint8List();
// }

  void onChanged(String text) {
    title.value = text;
  }

  //文字の反映をする
  void onSetWord() {
    textOption.addText(
      EditorText(
        text: title.value,
        offset: const Offset(0, 0),
        fontSizePx: 10,
        textColor: Colors.black,
        fontName: '',
      ),
    );
  }

  //画像の保存
  void onImageStore() {

  }
}
