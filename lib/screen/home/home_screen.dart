import 'package:bokete_create_app/gen/assets.gen.dart';
import 'package:bokete_create_app/screen/home/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  //final controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTapDown: (d) {
                //TODO 後で登録
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: Assets.images.background.image(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
