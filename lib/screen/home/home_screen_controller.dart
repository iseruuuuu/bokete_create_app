import 'dart:io';
import 'dart:typed_data';
import 'package:bokete_create_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_editor/image_editor.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final textOption = AddTextOption();
  final images = Assets.images.background.image();

  @override
  void onInit() {
    super.onInit();
  }

  //文字の反映をする
  void onSetWord() {
    textOption.addText(
      EditorText(
        text: 'うんち！',
        offset: const Offset(0, 0),
        fontSizePx: 10,
        textColor: Colors.black,
        fontName: '',
      ),
    );
  }

  //画像の保存
  void onImageStore() {}
}
