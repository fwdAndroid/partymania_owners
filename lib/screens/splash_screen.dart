import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partymania_owners/responsive/responsive_layout.dart';
import 'package:partymania_owners/screens/auth/login_screen.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/webmodule/webauth/web_login_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    check(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlack,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Image.asset("assets/splash.gif"))],
      ),
    );
  }
}

check(BuildContext context) {
  final User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ResponsiveLayout(
                      mobileScreenLayout: LoginScreen(),
                      webScreenLayout: WebLoginScreen(),
                    ))));
  } else {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ResponsiveLayout(
                      mobileScreenLayout: LoginScreen(),
                      webScreenLayout: WebLoginScreen(),
                    ))));
  }
}
