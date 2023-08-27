import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:partymania_owners/model/club_create_model.dart';
import 'package:partymania_owners/services/storage_methods.dart';

class FirebaseMethods {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<String> createClub(
      Uint8List coverPhoto,
      Uint8List ticketPhoto,
      String description,
      String uid,
      String clubLocation,
      String clubPhoneNumber,
      String clubName,
      String clubType,
      String clubState,
      String clubCity,
      String clubZipCode,
      String clubAmentities) async {
    String res = "Some Information Regarding Club is Missing";
    try {
      String clubPhoto = await StorageMethods()
          .uploadImageToStorage("clubCoverPhoto", coverPhoto, true);
      String clubTicketPhoto = await StorageMethods()
          .uploadImageToStorage("clubTablePhoto", ticketPhoto, true);
      ClubModel postModel = ClubModel(
          coverPhoto: clubPhoto,
          clubState: clubState,
          clubType: clubType,
          ticketPhoto: clubTicketPhoto,
          clubZipCode: clubZipCode,
          uid: FirebaseAuth.instance.currentUser!.uid,
          clubCity: clubCity,
          clubAmentities: clubAmentities,
          clubDescription: description,
          clubLocation: clubLocation,
          clubName: clubName,
          clubPhoneNumber: clubPhoneNumber);

      ///Uploading Post To Firebase
      _firebaseFirestore
          .collection('clubs')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(postModel.toJson());
      res = 'Sucessfully Uploaded in Firebase';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}
