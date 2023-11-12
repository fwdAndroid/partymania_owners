import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/auth/login_screen.dart';

class ClubRequest extends StatefulWidget {
  const ClubRequest({super.key});

  @override
  State<ClubRequest> createState() => _ClubRequestState();
}

class _ClubRequestState extends State<ClubRequest> {
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
                        builder: (builder) => const LoginScreen()));
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
          Image.asset("assets/splash.gif"),
          Text(
            "Please wait your club profile is under review",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
