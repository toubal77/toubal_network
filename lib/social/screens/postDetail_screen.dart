import 'package:flutter/material.dart';
import 'package:toubal_network/social/screens/profile_screen.dart';
import 'package:toubal_network/social/widgets/buildCommentPost.dart';

class PostDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (contex) {
                                return ProfileScreen();
                              },
                            ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/userImage1.jpg'),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'toubal zineddine',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateTime.now().toString(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.more_vert),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.width - 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 20,
                        offset: Offset(0, 10)),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/userImage4.jpg'),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Divider(
                height: 3,
                color: Colors.grey[400],
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.favorite),
                        Text(
                          '152 likes',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.comment),
                        Text(
                          '37 comments',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                height: 3,
                color: Colors.grey[400],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      BuildCommentPost(
                        imageUsers: 'assets/images/userImage5.jpg',
                        nameUsers: 'sousou ma9alcha',
                        contentComment: 'Lorem Ipsum is s',
                        timeAgo: '40 min ago',
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      BuildCommentPost(
                        imageUsers: 'assets/images/userImage1.jpg',
                        nameUsers: 'asus asus',
                        contentComment: 'It is a long establishe',
                        timeAgo: '44 min ago',
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      BuildCommentPost(
                        imageUsers: 'assets/images/userImage8.jpg',
                        nameUsers: 'wahran wahran',
                        contentComment: 'Lorem Ipsum is simply ',
                        timeAgo: '2h ago',
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      BuildCommentPost(
                        imageUsers: 'assets/images/userImage5.jpg',
                        nameUsers: 'marine le pen',
                        contentComment: 'I am racist.',
                        timeAgo: '19h ago',
                      ),
                    ],
                  ),
                ),
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
                          decoration: InputDecoration(
                            hintText: "Write Comment...",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {},
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
        ),
      ),
    );
  }
}
