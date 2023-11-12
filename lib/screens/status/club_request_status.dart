import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/main_dashboard.dart';
import 'package:partymania_owners/screens/profile/club_request_page.dart';

class ClubRequestStatus extends StatefulWidget {
  const ClubRequestStatus({super.key});

  @override
  State<ClubRequestStatus> createState() => _ClubRequestStatusState();
}

class _ClubRequestStatusState extends State<ClubRequestStatus> {
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
          context, MaterialPageRoute(builder: (builder) => ClubRequest()));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (builder) => MainScreen(
                    user: FirebaseAuth.instance.currentUser,
                  )));
    }
  }
}
