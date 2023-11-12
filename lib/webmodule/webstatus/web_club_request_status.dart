import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_owners/webmodule/web_main_screen.dart';
import 'package:partymania_owners/webmodule/webstatus/web_club_request.dart';

class WebClubRequestStatus extends StatefulWidget {
  const WebClubRequestStatus({super.key});

  @override
  State<WebClubRequestStatus> createState() => _WebClubRequestStatusState();
}

class _WebClubRequestStatusState extends State<WebClubRequestStatus> {
  final DocumentReference userRef = FirebaseFirestore.instance
      .collection('clubs')
      .doc(FirebaseAuth.instance.currentUser!.uid);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Verifying Clubs"),
      ),
    );
  }

  void check() async {
    final DocumentSnapshot userSnapshot = await userRef.get();
    Map<String, dynamic> data = userSnapshot.data() as Map<String, dynamic>;

    ;
    final isBlocked = data['clubRequest'];
    if (isBlocked == false) {
      // User is blocked
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => WebClubRequest()));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (builder) => WebMainScreen(
                    user: FirebaseAuth.instance.currentUser,
                  )));
    }
  }
}
