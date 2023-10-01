import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/main_dashboard.dart';
import 'package:partymania_owners/screens/profile/create_profile.dart';

class CheckPhoneStatus extends StatefulWidget {
  const CheckPhoneStatus({super.key});

  @override
  State<CheckPhoneStatus> createState() => _CheckPhoneStatusState();
}

class _CheckPhoneStatusState extends State<CheckPhoneStatus> {
  @override
  void initState() {
    // TODO: implement initState
    checkresult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Loading Please wait"),
      ),
    );
  }

  void checkresult() async {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    final bool doesDocExist = doc.exists;

    if (doesDocExist) {
      print("wrong which");
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => MainScreen()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => CreateProfile()));
    }
  }
}
