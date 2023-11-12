import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/status/club_request_status.dart';
import 'package:partymania_owners/screens/status/otpprofile/create_otp_profile.dart';

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
      Navigator.push(context,
          MaterialPageRoute(builder: (builder) => ClubRequestStatus()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => CreateOTPProfile()));
    }
  }
}
