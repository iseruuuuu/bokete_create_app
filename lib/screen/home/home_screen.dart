// // Flutter imports:
// import 'package:flutter/material.dart';
//
// // Package imports:
// import 'package:get/get.dart';
//
// // Project imports:
// import 'package:bokete_create_app/screen/home/home_screen_controller.dart';
// import 'package:image_editor/image_editor.dart';
//
// class HomeScreen extends StatelessWidget {
//   HomeScreen({Key? key}) : super(key: key);
//   final controller = Get.put(HomeScreenController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         elevation: 0,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Center(
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.width / 1.3,
//               //child: controller.images,
//               //child: Image.asset(controller.imagess),
//               child: controller.target == null
//                   ? Image.asset(controller.imagess)
//                   : Image(image: controller.target!),
//             ),
//           ),
//           Obx(() => Text(controller.title.value)),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             child: SizedBox(
//               width: 400,
//               height: 100,
//               child: TextField(
//                 maxLines: controller.maxLine,
//                 maxLength: 20,
//                 textAlign: TextAlign.center,
//                 controller: controller.textController,
//                 keyboardType: TextInputType.multiline,
//                 onChanged: (text) => controller.onChanged(text),
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//           ),
//           TextButton(
//             onPressed: () => controller.onChangeImages(),
//             child: const Text('文字を反映する'),
//           ),
//           TextButton(
//             onPressed: () => controller.onImageStore(),
//             child: const Text('画像を保存する'),
//           ),
//         ],
//       ),
//     );
//   }
// }
