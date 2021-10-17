// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:bokete_create_app/screen/home/home_screen_controller.dart';

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              maxLines: 1,
              maxLength: 20,
              textAlign: TextAlign.center,
              controller: controller.textController,
              onChanged: (text) => controller.onChanged(text),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
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
