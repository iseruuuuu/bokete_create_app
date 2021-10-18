// // Dart imports:
// import 'dart:io';
// import 'dart:typed_data';
//
// // Flutter imports:
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// // Package imports:
// import 'package:get/get.dart';
// import 'package:image_editor/image_editor.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
//
// // Project imports:
// import 'package:bokete_create_app/gen/assets.gen.dart';
//
// class HomeScreenController extends GetxController {
//   final textOption = AddTextOption();
//   final editOption = ImageEditorOption();
//   final textController = TextEditingController();
//
//   //final target = ImageProvider;
//   ImageProvider? target;
//   final images = Assets.images.background.image();
//   var imagess = 'assets/images/background.png';
//   var title = ''.obs;
//   var maxLine = 3;
//
//   //ImageProvider? target;
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//     onChangeImages();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//     textController.dispose();
//   }
//
//   //メモ
//   /*
//   TODO やること
//   ・画像にテキストを貼れるようにしたい。
//   ・保存するときは、Uint8Listで保存する
//   ・TextFieldを3行までにしたい（今は、なぜかたくさんになる）
//    */
//
//   void onChangeImages() async {
//     textOption.addText(
//       EditorText(
//         offset: const Offset(50, 50),
//         text: title.toString(),
//         fontSizePx: 20,
//         textColor: const Color(0xFF995555),
//         fontName: '',
//       ),
//     );
//     editOption.outputFormat = const OutputFormat.png();
//     editOption.addOption(textOption);
//
//     final Uint8List list = await getAssetImage();
//     final Uint8List? result = await ImageEditor.editImage(
//       image: list,
//       imageEditorOption: editOption,
//     );
//
//     if (result == null) {
//       return;
//     }
//     //print(target);//null
//     target = MemoryImage(result);
//     //print(target);//MemoryImage(_Uint8ArrayView#9718d, scale: 1.0)
//     // print(MemoryImage(result));
//   }
//
//   Future<Uint8List> getAssetImage() async {
//     final ByteData byteData = await rootBundle.load(imagess);
//     return byteData.buffer.asUint8List();
//   }
//
//   void onChanged(String text) {
//     title.value = text;
//   }
//
//   //文字の反映をする
//   void onSetWord() {
//     textOption.addText(
//       EditorText(
//         text: title.value,
//         offset: const Offset(0, 0),
//         fontSizePx: 10,
//         textColor: Colors.black,
//         fontName: '',
//       ),
//     );
//   }
//
//   //画像の保存
//   // void onImageStore(File image) async {
//   void onImageStore() async {
//     // Uint8List _buffer = await image.readAsBytes();
//     // final result = await ImageGallerySaver.saveImage(_buffer);
//   }
// }
