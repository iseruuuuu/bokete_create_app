import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: target != null ? Image(image: target!) : Image.asset(assets),
          ),
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
          TextButton(
            onPressed: () async {
              await addText(fontName);
            },
            child: const Text('文字を反映する'),
          ),
          TextButton(
            onPressed: () {
              onImageStore();
            },
            child: const Text('画像を保存する'),
          ),
        ],
      ),
    );
  }

  Future addText(String fontName) async {
    const int size = 60;
    final ImageEditorOption option = ImageEditorOption();
    final AddTextOption textOption = AddTextOption();
    textOption.addText(
      EditorText(
        offset: const Offset(80, 240),
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
    setState(() {});
  }

  Future<Uint8List> getAssetImage() async {
    final ByteData byteData = await rootBundle.load(assets);
    return byteData.buffer.asUint8List();
  }

  void onImageStore() async {
    // var response = await Dio().get(target.toString(),
    //     options: Options(responseType: ResponseType.bytes));
    // final result = await ImageGallerySaver.saveImage(
    //     Uint8List.fromList(response.data),
    //     quality: 60,
    //     name: "hello");

    //Uint8List _buffer = await

    //ImageProvider<Object>? target
    //Uint8List _buffer =  await rootBundle.load(target).buffer
    // var _buffer = await rootBundle.load('')..buffer.asUint8List();
    // final result = await ImageGallerySaver.saveImage(_buffer);

    // (await rootBundle.load(target)).buffer.asUint8List();

    // ByteData imageData;
    // rootBundle.load('assets/test.jpg')
    //     .then((data) => setState(() => this.imageData = data));

    // var data = await rootBundle.load(target.toString());
    // setState(() => this.imageData = data);

    final ByteData bytes = await rootBundle.load(target.toString());
    final Uint8List list = bytes.buffer.asUint8List();

    final result = await ImageGallerySaver.saveImage(list);
  }
}
