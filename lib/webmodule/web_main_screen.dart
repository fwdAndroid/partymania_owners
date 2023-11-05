import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/dashboard/event_page.dart';
import 'package:partymania_owners/screens/dashboard/profile_page.dart';
import 'package:partymania_owners/screens/dashboard/scan_page.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/webmodule/web_dashboard/web_event_page.dart';
import 'package:partymania_owners/webmodule/web_dashboard/web_home_page.dart';
import 'package:partymania_owners/webmodule/web_dashboard/web_profile_page.dart';

class WebMainScreen extends StatefulWidget {
  User? user;
  WebMainScreen({required this.user});
  @override
  _WebMainScreenState createState() => _WebMainScreenState();
}

class _WebMainScreenState extends State<WebMainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    WebHomePage(), // Replace with your screen widgets
    WebEventsPage(),
    WebProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              _currentIndex == 0 ? 'assets/homeblue.png' : 'assets/home.png',
              height: 25,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _currentIndex == 1 ? 'assets/mcolor.png' : 'assets/message.png',
              height: 25,
            ),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Image.asset(
              _currentIndex == 2 ? 'assets/profile_color.png' : 'assets/p.png',
              height: 25,
            ),
          ),
        ],
        unselectedLabelStyle: TextStyle(color: textColor.withOpacity(.8)),
        selectedLabelStyle: TextStyle(color: textColor),
        backgroundColor:
            backgroundColor, // Set your desired background color here
        selectedItemColor: textColor, // Set the color for selected item
        unselectedItemColor:
            textColor.withOpacity(.8), // Set the color for unselected items
      ),
    );
  }
}
