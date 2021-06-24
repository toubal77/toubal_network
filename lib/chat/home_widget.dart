import 'package:flutter/material.dart';
import 'package:toubal_network/chat/screens/chat_screen.dart';
import 'package:toubal_network/chat/screens/contact_screen.dart';
import 'package:toubal_network/chat/screens/profile_screen.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetsOptions = [
      ChatScreen(),
      ContactScreen(),
      ProfileScreen(),
    ];
    void onTapBottomNavigation(index) {
      setState(() {
        selectIndex = index;
      });
    }

    return Scaffold(
        body: widgetsOptions.elementAt(selectIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey.shade600,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          elevation: 0,
          onTap: onTapBottomNavigation,
          currentIndex: selectIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Profile',
            ),
          ],
        ));
  }
}
