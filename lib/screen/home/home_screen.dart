import 'dart:typed_data';

import 'package:bokete_create_app/gen/assets.gen.dart';
import 'package:bokete_create_app/screen/home/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_editor/image_editor.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: controller.images,
            ),
          ),
          TextField(
            maxLength: 10,
            maxLines: 1,
            onChanged: (text) => controller.onChanged(text),
          ),
          TextButton(
            onPressed: () => controller.onSetWord(),
            child: const Text('文字を反映する'),
          ),
          TextButton(
            onPressed: () {
              //TODO 後で登録
            },
            child: const Text('画像を保存する'),
          )
        ],
      ),
    );
  }
}
