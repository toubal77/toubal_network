import 'package:flutter/material.dart';
import 'package:toubal_network/chat/services/database.dart';

class Message extends StatelessWidget {
  final messageDoc;
  final userId;
  final idDoc;
  Message({this.messageDoc, this.userId, this.idDoc});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      child: Align(
        alignment: (messageDoc['idUser'] != userId
            ? Alignment.topLeft
            : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: messageDoc['idUser'] != userId
                  ? Radius.circular(0)
                  : Radius.circular(20),
              topLeft: messageDoc['idUser'] != userId
                  ? Radius.circular(20)
                  : Radius.circular(20),
              topRight: messageDoc['idUser'] != userId
                  ? Radius.circular(20)
                  : Radius.circular(0),
              bottomRight: messageDoc['idUser'] != userId
                  ? Radius.circular(20)
                  : Radius.circular(20),
            ),
            color: (messageDoc['idUser'] != userId
                ? Colors.grey.shade200
                : Colors.blue[200]),
          ),
          padding: EdgeInsets.all(16),
          child: messageDoc['imageMsg'] == true
              ? GestureDetector(
                  onDoubleTap: () {
                    if (messageDoc['idUser'] == userId)
                      DatabaseMethods().deleteMessage(idDoc);
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(messageDoc['messageContent']),
                  ),
                )
              : GestureDetector(
                  onDoubleTap: () {
                    if (messageDoc['idUser'] == userId)
                      DatabaseMethods().deleteMessage(idDoc);
                  },
                  child: Text(
                    messageDoc['messageContent'],
                    style: TextStyle(fontSize: 15),
                  ),
                ),
        ),
      ),
    );
  }
}
