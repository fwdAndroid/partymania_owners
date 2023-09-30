import 'package:flutter/material.dart';
import 'package:partymania_owners/handlermodule/pages/handler_home.dart';
import 'package:partymania_owners/handlermodule/pages/handler_profile_page.dart';
import 'package:partymania_owners/handlermodule/pages/handler_scan_page.dart';
import 'package:partymania_owners/utils/colors.dart';

class HandlerDashboard extends StatefulWidget {
  @override
  _HandlerDashboardState createState() => _HandlerDashboardState();
}

class _HandlerDashboardState extends State<HandlerDashboard> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePageHandler(), // Replace with your screen widgets
    HandlerScanPage(),
    HandlerProfilePage()
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
            label: "Scan",
            icon: Image.asset(
              _currentIndex == 1
                  ? 'assets/scan-barcode_1.png'
                  : 'assets/scan-barcode.png',
              height: 25,
            ),
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
