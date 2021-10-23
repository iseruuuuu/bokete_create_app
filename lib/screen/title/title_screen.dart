import 'package:bokete_create_app/screen/title/title_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TitleScreenController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 2,
        title: const Text(
          '大喜利メーカー',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: controller.onTap1,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3.5,
                color: Colors.yellow,
                child: const Center(
                  child: Text(
                    '1行で作成',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            // ElevatedButton(
            //   onPressed: controller.onTap1,
            //   style: ButtonStyle(
            //     textStyle: Colors.yellow,
            //   ),
            //   child: const Text(
            //     '1行で作成',
            //     style: TextStyle(
            //       fontSize: 30,
            //       color: Colors.black,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),

            GestureDetector(
              onTap: controller.onTap2,
              child: const Text(
                '2行で作成',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: controller.onTap3,
              child: const Text(
                '3行で作成',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
