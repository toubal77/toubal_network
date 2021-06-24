import 'package:flutter/material.dart';
import 'package:toubal_network/social/widgets/buildPost.dart';
import 'package:toubal_network/social/widgets/buildStatusProfile.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0.0,
        title: Text('Toubal zine-eddine'),
        actions: [
          Icon(Icons.more_vert),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 35),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 20,
                ),
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/userImage6.jpg'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Toubal Zine-eddine',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Flutter Developper',
            style: TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BuildStatusProfile(
                value: 54,
                title: 'Posts',
              ),
              BuildStatusProfile(
                value: 157,
                title: 'Followers',
              ),
              BuildStatusProfile(
                value: 150,
                title: 'Following',
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 150,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: Colors.blue[500],
            ),
            child: Center(
              child: Text(
                'Follow',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
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
          ),
        ],
      ),
    );
  }
}
