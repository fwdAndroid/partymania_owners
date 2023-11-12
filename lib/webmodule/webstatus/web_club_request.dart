import 'package:flutter/material.dart';
import 'package:partymania_owners/webmodule/webauth/web_login_screen.dart';

class WebClubRequest extends StatefulWidget {
  const WebClubRequest({super.key});

  @override
  State<WebClubRequest> createState() => _WebClubRequestState();
}

class _WebClubRequestState extends State<WebClubRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const WebLoginScreen()));
              },
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ))
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            "assets/splash.gif",
            height: 200,
          )),
          Text(
            "Please wait your club profile is under review",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
