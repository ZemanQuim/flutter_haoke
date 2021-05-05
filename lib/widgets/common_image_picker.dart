import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// 图片宽750px，高424px；
var imageWidth = 750.0;
var imageHeight = 424.0;
var imageWidthHeightRatio = imageWidth / imageHeight;

class CommonImagePicker extends StatefulWidget {
  final ValueChanged<List<File>> onChange;

  const CommonImagePicker({Key key, this.onChange}) : super(key: key);
  @override
  _CommonImagePickerState createState() => _CommonImagePickerState();
}

class _CommonImagePickerState extends State<CommonImagePicker> {
  List<File> files = [];
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (null != pickedFile) {
      setState(() {
        files = files..add(File(pickedFile.path));
      });
      if (widget.onChange != null) {
        widget.onChange(files);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width - 10.0 * 4) / 3;
    var height = width / imageWidthHeightRatio;

    Widget addButton = GestureDetector(
      onTap: () {
        getImage();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: width,
        height: height,
        color: Colors.grey,
        child: Center(
          child: Text(
            '+',
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
    Widget wrapper(File file) {
      return Stack(overflow: Overflow.visible, children: [
        Image.file(
          file,
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
        Positioned(
          right: -20.0,
          top: -20.0,
          child: IconButton(
            icon: Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
            onPressed: () {
              setState(() {
                files = files..remove((file));
              });
              if (null != widget.onChange) {
                widget.onChange(files);
              }
            },
          ),
        )
      ]);
    }

    List<Widget> list = files.map((e) => wrapper(e)).toList()..add(addButton);

    return Container(
      padding: EdgeInsets.all(9.0),
      child: Wrap(
        children: list,
        spacing: 10.0,
        runSpacing: 10.0,
      ),
    );
  }
}
