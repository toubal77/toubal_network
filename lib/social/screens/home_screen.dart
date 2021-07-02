import 'package:flutter/material.dart';
import 'package:toubal_network/chat/home_widget.dart';
import 'package:toubal_network/social/screens/profile_screen.dart';
import 'package:toubal_network/social/services/database.dart';
import 'package:toubal_network/social/widgets/buildPost.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    child: FutureBuilder(
                      future: DatabaseMethods().getImageUser(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData)
                          return CircleAvatar(
                            backgroundImage:
                                NetworkImage(snapshot.data.toString()),
                          );
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                  Text(
                    "Toubal Network",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.message),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeWidget(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 8),
              children: <Widget>[
                BuildPost(
                  image: 'assets/images/userImage1.jpg',
                  name: 'Toubal zine-eddine',
                  imagePost: 'assets/images/userImage2.jpg',
                  numLike: 936,
                ),
                BuildPost(
                  image: 'assets/images/userImage2.jpg',
                  name: 'Mohamed moh',
                  imagePost: 'assets/images/userImage3.jpg',
                  numLike: 75,
                ),
                BuildPost(
                  image: 'assets/images/userImage3.jpg',
                  name: 'Point de vus',
                  imagePost: 'assets/images/userImage4.jpg',
                  numLike: 1548,
                ),
                BuildPost(
                  image: 'assets/images/userImage4.jpg',
                  name: 'Marine le pen',
                  imagePost: 'assets/images/userImage5.jpg',
                  numLike: 1,
                ),
                BuildPost(
                  image: 'assets/images/userImage5.jpg',
                  name: 'Francois Hollande',
                  imagePost: 'assets/images/userImage6.jpg',
                  numLike: 154,
                ),
                BuildPost(
                  image: 'assets/images/userImage6.jpg',
                  name: 'Asus Asus',
                  imagePost: 'assets/images/userImage7.jpg',
                  numLike: 200,
                ),
                BuildPost(
                  image: 'assets/images/userImage7.jpg',
                  name: 'Sousous m9alcha',
                  imagePost: 'assets/images/userImage8.jpg',
                  numLike: 9999,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
