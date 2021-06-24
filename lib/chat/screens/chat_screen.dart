import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toubal_network/chat/widgets/conversationList.dart';
import 'package:toubal_network/social/home_widget.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // List<ChatUsers> chatUsers = [
  //   ChatUsers(
  //     name: "Jane Russel",
  //     messageText: "Awesome Setup",
  //     imageURL: "assets/images/userImage1.jpg",
  //     time: "Now",
  //   ),
  //   ChatUsers(
  //       name: "Glady's Murphy",
  //       messageText: "That's Great",
  //       imageURL: "assets/images/userImage2.jpg",
  //       time: "Yesterday"),
  //   ChatUsers(
  //       name: "Jorge Henry",
  //       messageText: "Hey where are you?",
  //       imageURL: "assets/images/userImage3.jpg",
  //       time: "31 Mar"),
  //   ChatUsers(
  //       name: "Philip Fox",
  //       messageText: "Busy! Call me in 20 mins",
  //       imageURL: "assets/images/userImage4.jpg",
  //       time: "28 Mar"),
  //   ChatUsers(
  //       name: "Debra Hawkins",
  //       messageText: "Thankyou, It's awesome",
  //       imageURL: "assets/images/userImage5.jpg",
  //       time: "23 Mar"),
  //   ChatUsers(
  //       name: "Jacob Pena",
  //       messageText: "will update you in evening",
  //       imageURL: "assets/images/userImage6.jpg",
  //       time: "17 Mar"),
  //   ChatUsers(
  //       name: "Andrey Jones",
  //       messageText: "Can you please share the file?",
  //       imageURL: "assets/images/userImage7.jpg",
  //       time: "24 Feb"),
  //   ChatUsers(
  //       name: "John Wick",
  //       messageText: "How are you?",
  //       imageURL: "assets/images/userImage8.jpg",
  //       time: "18 Feb"),
  //   ChatUsers(
  //     name: "Jane Russel",
  //     messageText: "Awesome Setup",
  //     imageURL: "assets/images/userImage1.jpg",
  //     time: "Now",
  //   ),
  //   ChatUsers(
  //       name: "Glady's Murphy",
  //       messageText: "That's Great",
  //       imageURL: "assets/images/userImage2.jpg",
  //       time: "Yesterday"),
  //   ChatUsers(
  //       name: "Jorge Henry",
  //       messageText: "Hey where are you?",
  //       imageURL: "assets/images/userImage3.jpg",
  //       time: "31 Mar"),
  //   ChatUsers(
  //       name: "Philip Fox",
  //       messageText: "Busy! Call me in 20 mins",
  //       imageURL: "assets/images/userImage4.jpg",
  //       time: "28 Mar"),
  //   ChatUsers(
  //       name: "Debra Hawkins",
  //       messageText: "Thankyou, It's awesome",
  //       imageURL: "assets/images/userImage5.jpg",
  //       time: "23 Mar"),
  //   ChatUsers(
  //       name: "Jacob Pena",
  //       messageText: "will update you in evening",
  //       imageURL: "assets/images/userImage6.jpg",
  //       time: "17 Mar"),
  //   ChatUsers(
  //       name: "Andrey Jones",
  //       messageText: "Can you please share the file?",
  //       imageURL: "assets/images/userImage7.jpg",
  //       time: "24 Feb"),
  //   ChatUsers(
  //       name: "John Wick",
  //       messageText: "How are you?",
  //       imageURL: "assets/images/userImage8.jpg",
  //       time: "18 Feb"),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Conversations",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeWidget(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/userImage6.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
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
                            'you never talk with your friend ley invite him !!'),
                      )
                    : ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 16),
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ConversationList(
                            id: data[index]['userId'],
                            name: data[index]['username'],
                            messageText: "Thankyou, It's awesome",
                            imageUrl: data[index]['imageUrl'],
                            time: "28 Mar",
                            isMessageRead:
                                (index == 0 || index == 3) ? true : false,
                          );
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
