import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_editor/image_editor.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class HomeFulScreen extends StatefulWidget {
  const HomeFulScreen({Key? key}) : super(key: key);

  @override
  _HomeFulScreenState createState() => _HomeFulScreenState();
}

class _HomeFulScreenState extends State<HomeFulScreen> {
  final TextEditingController _controller = TextEditingController(text: '');
  ImageProvider? target;
  String fontName = '';
  String assets = 'assets/images/odai.png';
  late Uint8List _uint8list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          '大喜利 メーカー',
          style: TextStyle(color: Colors.lightBlue),
        ),
      ),
      body: Column(
        children: <Widget>[
          target != null ? Image(image: target!) : Image.asset(assets),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SizedBox(
              width: 400,
              height: 100,
              child: TextField(
                maxLines: 1,
                maxLength: 10,
                textAlign: TextAlign.center,
                controller: _controller,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () async {
              await addText(fontName);
            },
            child: const Text('文字を反映する'),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              onImageStore();
            },
            child: const Text('画像を保存する'),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Future addText(String fontName) async {
    const int size = 60;
    final ImageEditorOption option = ImageEditorOption();
    final AddTextOption textOption = AddTextOption();
    var position = Offset(0, 0);
    if (_controller.text.isEmpty) {
      position = const Offset(0, 0);
    } else if (_controller.text.length == 1) {
      position = Offset(330, 240);
    } else if (_controller.text.length == 2) {
      position = Offset(300, 240);
    } else if (_controller.text.length == 3) {
      position = Offset(270, 240);
    } else if (_controller.text.length == 4) {
      position = Offset(250, 240);
    } else if (_controller.text.length == 5) {
      position = Offset(220, 240);
    } else if (_controller.text.length == 6) {
      position = Offset(190, 240);
    } else if (_controller.text.length == 7) {
      position = Offset(170, 240);
    } else if (_controller.text.length == 8) {
      position = Offset(150, 240);
    } else if (_controller.text.length == 9) {
      position = Offset(130, 240);
    } else if (_controller.text.length == 10) {
      position = Offset(100, 240);
    }
    textOption.addText(
      EditorText(
        //offset: const Offset(80, 240),
        offset: position,
        text: _controller.text,
        fontSizePx: size,
        textColor: Colors.black,
        fontName: fontName,
      ),
    );
    option.outputFormat = const OutputFormat.png();
    option.addOption(textOption);
    final Uint8List u = await getAssetImage();
    final Uint8List? result = await ImageEditor.editImage(
      image: u,
      imageEditorOption: option,
    );
    if (result == null) {
      return;
    }
    target = MemoryImage(result);
    _uint8list = result;

    setState(() {});
  }

  Future<Uint8List> getAssetImage() async {
    final ByteData byteData = await rootBundle.load(assets);
    return byteData.buffer.asUint8List();
  }

  void onImageStore() async {
    final result = await ImageGallerySaver.saveImage(_uint8list);
  }
}