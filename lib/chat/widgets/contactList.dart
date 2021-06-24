import 'package:flutter/material.dart';
import 'package:toubal_network/chat/screens/chatDetail_screen.dart';

class ContactList extends StatelessWidget {
  final cntUsers;
  ContactList({this.cntUsers});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ChatDetailScreen(
                id: cntUsers['id'],
                name: cntUsers['username'],
                imageUrl: cntUsers['imageUrls'],
              );
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
                    ),
                    maxRadius: 30,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Text(
                        cntUsers['username'],
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.call,
                  color: Colors.black54,
                ),
                SizedBox(width: 15.0),
                Icon(
                  Icons.video_call,
                  color: Colors.black54,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
