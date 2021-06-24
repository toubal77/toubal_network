import 'package:flutter/material.dart';
import 'package:toubal_network/auth_screen.dart';
import 'package:toubal_network/chat/services/auth.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 10),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Text(
                    "Profile",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 115,
                  width: 115,
                  child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.expand,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/userImage2.jpg'),
                      ),
                      Positioned(
                        right: -12,
                        bottom: 0,
                        child: SizedBox(
                          height: 46,
                          width: 46,
                          child: IconButton(
                            onPressed: () {},
                            iconSize: 20.0,
                            icon: Container(
                              width: 50,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(
                                Icons.edit,
                                size: 22.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Color(0xFFF5F6F9),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.account_circle),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(child: Text('My Account')),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Color(0xFFF5F6F9),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.pages),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(child: Text('Confidentialite')),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Color(0xFFF5F6F9),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.notifications),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(child: Text('Sons et notifications')),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Color(0xFFF5F6F9),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.picture_in_picture_sharp),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(child: Text('Photos et medias')),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Color(0xFFF5F6F9),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.settings_applications),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(child: Text('Parametres de compte')),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Color(0xFFF5F6F9),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.sync_problem),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(child: Text('Singler un probleme technique')),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Color(0xFFF5F6F9),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.book),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(child: Text('Mentions legales et politiques')),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Color(0xFFF5F6F9),
                    onPressed: () {
                      AuthService().signOut();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AuthScreen(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(child: Text('Log out')),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
