// Flutter imports:
import 'package:bokete_create_app/screen/home_ful/home_ful_screen.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomeScreen(),
      home: HomeFulScreen(),
    );
  }
}
