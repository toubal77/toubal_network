import 'dart:io';

import 'package:flutter/material.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagePickFn);

  final void Function(File pickedImage) imagePickFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  late File _pickedImage;
  // void _pickImage() async {
  //   final pickedImageFile = await ImagePicker().getImage(
  //     source: ImageSource.camera,
  //     maxWidth: 300,
  //     maxHeight: 300,
  //   );
  //   setState(() {
  //     _pickedImage = File(pickedImageFile!.path);
  //   });
  //   widget.imagePickFn(_pickedImage);
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage:
              // ignore: unnecessary_null_comparison
              _pickedImage != null ? FileImage(_pickedImage) : null,
        ),
        TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.image),
          label: Text('Add Image'),
        ),
      ],
    );
  }
}
