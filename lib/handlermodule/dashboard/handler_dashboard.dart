import 'package:flutter/material.dart';
import 'package:partymania_owners/handlermodule/pages/handler_home.dart';
import 'package:partymania_owners/handlermodule/pages/handler_profile_page.dart';
import 'package:partymania_owners/handlermodule/pages/handler_scan_page.dart';
import 'package:partymania_owners/utils/colors.dart';

class HandlerDashboard extends StatefulWidget {
  String ownerId;
  HandlerDashboard({required this.ownerId});
  @override
  _HandlerDashboardState createState() => _HandlerDashboardState();
}

class _HandlerDashboardState extends State<HandlerDashboard> {
  int _currentIndex = 0;

  // final List _screens = [
  //   HomePageHandler(), // Replace with your screen widgets
  //   HandlerScanPage(
  //     ownerId: widget.ownerId,
  //   ),
  //   HandlerProfilePage()
  // ];

  @override
  Widget build(BuildContext context) {
    PageController _myPage = PageController(initialPage: 0);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: backgroundColor,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 75,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                tooltip: 'Home',
                icon: Image.asset(
                  height: 25,
                  _currentIndex == 0
                      ? 'assets/homeblue.png'
                      : 'assets/home.png',
                ),
                onPressed: () {
                  _myPage.jumpToPage(0);
                },
              ),
              IconButton(
                tooltip: 'Favorite',
                icon: Image.asset(
                  height: 25,
                  _currentIndex == 1
                      ? 'assets/scan-barcode_1.png'
                      : 'assets/scan-barcode.png',
                ),
                onPressed: () {
                  _myPage.jumpToPage(1);
                },
              ),
              IconButton(
                tooltip: 'Favorite',
                icon: Image.asset(
                  height: 25,
                  _currentIndex == 2
                      ? 'assets/profile_color.png'
                      : 'assets/p.png',
                ),
                onPressed: () {
                  _myPage.jumpToPage(2);
                },
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: _myPage,
        onPageChanged: (int) {
          print('Page Changes to index $int');
        },
        children: <Widget>[
          HomePageHandler(),
          HandlerScanPage(ownerId: widget.ownerId),
          HandlerProfilePage()
        ],
        physics:
            NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
      ),
    );
  }
}
