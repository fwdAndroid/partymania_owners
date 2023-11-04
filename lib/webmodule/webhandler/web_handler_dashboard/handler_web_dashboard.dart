import 'package:flutter/material.dart';
import 'package:partymania_owners/handlermodule/pages/handler_home.dart';
import 'package:partymania_owners/handlermodule/pages/handler_profile_page.dart';
import 'package:partymania_owners/handlermodule/pages/handler_scan_page.dart';
import 'package:partymania_owners/utils/colors.dart';

class HandlerWebDashboard extends StatefulWidget {
  String ownerId;
  HandlerWebDashboard({required this.ownerId});
  @override
  _HandlerWebDashboardState createState() => _HandlerWebDashboardState();
}

class _HandlerWebDashboardState extends State<HandlerWebDashboard> {
  int _currentIndex = 0;

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
            mainAxisAlignment: MainAxisAlignment.center,
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
              const SizedBox(
                width: 20,
              ),
              IconButton(
                tooltip: 'Favorite',
                icon: Image.asset(
                  height: 25,
                  _currentIndex == 1
                      ? 'assets/profile_color.png'
                      : 'assets/p.png',
                ),
                onPressed: () {
                  _myPage.jumpToPage(1);
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
          HomePageHandler(
            ownerId: widget.ownerId,
          ),
          HandlerProfilePage()
        ],
        physics:
            NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
      ),
    );
  }
}
