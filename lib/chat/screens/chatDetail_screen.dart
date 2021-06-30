import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toubal_network/chat/models/chatMessage.dart';
import 'package:toubal_network/chat/services/database.dart';
import 'package:toubal_network/chat/widgets/message.dart';

// ignore: must_be_immutable
class ChatDetailScreen extends StatefulWidget {
  String id;
  String name;
  String imageUrl;
  ChatDetailScreen({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  TextEditingController messageContent = TextEditingController();
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];
  sendMessage(String friendId, String messageContent) async {
    User? _user = FirebaseAuth.instance.currentUser;
    String userId = _user!.uid;
    // var time = DateTime.now();
    String chatRoomId = (userId.hashCode + friendId.hashCode).toString();
    var _dataMessage = {
      'chatRoomId': chatRoomId,
      'idFrom': userId,
      'idIn': friendId,
      // 'time': time,
      'messageContent': messageContent,
      'read': false,
    };

    await DatabaseMethods().sendMessage(chatRoomId, _dataMessage);
  }

  @override
  Widget build(BuildContext context) {
    User? _user = FirebaseAuth.instance.currentUser;
    String userId = _user!.uid;
    // ignore: unused_local_variable
    String chatRoomId = (userId.hashCode + widget.id.hashCode).toString();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.imageUrl),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.call,
                  color: Colors.black54,
                ),
                SizedBox(width: 10.0),
                Icon(
                  Icons.video_call,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('ChatRoom')
                .where('chatRoomId', isEqualTo: chatRoomId)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Something went wrong'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Text("Loading"));
              }
              final data = snapshot.data!.docs;
              return data.length == 0
                  ? Center(
                      child: Text(
                          'you never talk with your friend ley send him a message !!'),
                    )
                  : ListView.builder(
                      itemCount: data.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Message(
                          messageDoc: data[index].data(),
                          userId: userId,
                        );
                      },
                    );
            },
          ),
          Align(
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
                        Icon(
                          Icons.image,
                          color: Colors.blue,
                          size: 20,
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
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      sendMessage(widget.id, messageContent.text.trim());
                      messageContent.clear();
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
          ),
        ],
      ),
    );
  }
}
