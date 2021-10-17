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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 1.3,
              child: controller.images,
            ),
          ),
          Obx(() => Text(controller.title.value)),
          TextField(
            maxLines: 1,
            maxLength: 20,
            textAlign: TextAlign.center,
            onChanged: (text) => controller.onChanged(text),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          TextButton(
            onPressed: () => controller.onSetWord(),
            child: const Text('文字を反映する'),
          ),
          TextButton(
            onPressed: () => controller.onImageStore(),
            child: const Text('画像を保存する'),
          )
        ],
      ),
    );
  }
}
