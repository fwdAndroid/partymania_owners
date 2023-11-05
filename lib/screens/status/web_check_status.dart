import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/main_dashboard.dart';
import 'package:partymania_owners/screens/profile/create_profile.dart';
import 'package:partymania_owners/webmodule/web_main_screen.dart';
import 'package:partymania_owners/webmodule/webclub/web_club_profile.dart';

class WebCheckStatus extends StatefulWidget {
  const WebCheckStatus({super.key});

  @override
  State<WebCheckStatus> createState() => _WebCheckStatusState();
}

class _WebCheckStatusState extends State<WebCheckStatus> {
  @override
  void initState() {
    // TODO: implement initState
    checkresult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Verifying Club"),
      ),
    );
  }

  void checkresult() async {
    final doc = await FirebaseFirestore.instance
        .collection('clubs')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    final bool doesDocExist = doc.exists;

    if (doesDocExist) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (builder) => WebMainScreen(
                    user: FirebaseAuth.instance.currentUser,
                  )));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => WebClubProfile()));
    }
  }
}
