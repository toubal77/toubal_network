import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toubal_network/chat/services/auth.dart';
import 'package:toubal_network/chat/services/database.dart';

// ignore: must_be_immutable
class NewMessage extends StatefulWidget {
  String idRoom;
  NewMessage({
    required this.idRoom,
  });
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  TextEditingController messageContent = TextEditingController();
  late File _pickedImage;
  var _sourceImage;
  var _enteredMessage = '';
  _sendMessage(bool sendImage) async {
    if (sendImage) {
      showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: Text('Image Source'),
          content: Text(' What is source of your image ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  _sourceImage = ImageSource.camera;
                });
              },
              child: Text('camera'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _sourceImage = ImageSource.gallery;
                });
              },
              child: Text('gallery'),
            ),
          ],
        ),
      );
      final pickedImageFile = await ImagePicker().getImage(
        source: _sourceImage,
        maxWidth: 300,
        maxHeight: 300,
      );
      setState(() {
        _pickedImage = File(pickedImageFile!.path);
      });
      DatabaseMethods().sendMessageImage(widget.idRoom, _pickedImage);
    } else {
      String userId = AuthService().getIdUser();
      var _dataMessage = {
        'chatRoomId': widget.idRoom,
        'idUser': userId,
        'createdAt': Timestamp.now(),
        'messageContent': _enteredMessage,
        'imageMsg': false,
        'read': false,
      };

      await DatabaseMethods().sendMessage(widget.idRoom, _dataMessage);
      _enteredMessage = '';
      messageContent.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
        height: 60,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.camera,
                    color: Colors.blue,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _sendMessage(true);
                      });
                    },
                    child: Icon(
                      Icons.image,
                      color: Colors.blue,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextField(
                autofocus: true,
                maxLines: 4,
                controller: messageContent,
                decoration: InputDecoration(
                  hintText: "Write message...",
                  hintStyle: TextStyle(color: Colors.black54),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  _enteredMessage = value;
                },
              ),
            ),
            SizedBox(
              width: 15,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  // ignore: unnecessary_statements
                  _enteredMessage.trim().isEmpty ? null : _sendMessage(false);
                });
              },
              child: Icon(
                Icons.send,
                color: Colors.white,
                size: 18,
              ),
              backgroundColor: Colors.blue,
              elevation: 0,
            ),
          ],
        ),
      ),
    );
  }
}
