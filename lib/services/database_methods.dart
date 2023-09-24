import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:partymania_owners/model/club_create_model.dart';
import 'package:partymania_owners/model/event_model.dart';
import 'package:partymania_owners/services/storage_methods.dart';
import 'package:uuid/uuid.dart';

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
      String clubCountry,
      String clubZipCode,
      var clubAmentities) async {
    String res = "Some Information Regarding Club is Missing";
    try {
      String clubPhoto = await StorageMethods()
          .uploadImageToStorage("clubCoverPhoto", coverPhoto, true);
      String clubTicketPhoto = await StorageMethods()
          .uploadImageToStorage("clubTablePhoto", ticketPhoto, true);
      ClubModel postModel = ClubModel(
          followers: [],
          clubCountry: clubCountry,
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
      res = 'Successfully Event is Created';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> updateClub(
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
      String clubCountry,
      String clubZipCode,
      List<String> clubAmentities) async {
    String res = "Some Information Regarding Club is Missing";
    try {
      String clubPhoto = await StorageMethods()
          .uploadImageToStorage("clubCoverPhoto", coverPhoto, true);
      String clubTicketPhoto = await StorageMethods()
          .uploadImageToStorage("clubTablePhoto", ticketPhoto, true);
      ClubModel postModel = ClubModel(
          followers: [],
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
          clubCountry: clubCountry,
          clubPhoneNumber: clubPhoneNumber);

      ///Uploading Post To Firebase
      _firebaseFirestore
          .collection('clubs')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update(postModel.toJson());
      res = 'Successfully Club is Updated';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  //Event
  Future<String> createEvent(
      String eventName,
      String eventDate,
      String fromTime,
      String createOffer,
      String eventType,
      Uint8List eventCoverPhoto,
      Uint8List eventPhoto,
      String eventDescription,
      String uid,
      String eventLocation,
      String timeDeadlineTicket,
      String toDate,
      String nameOffer,
      final coupleValue,
      final tickets,
      final tables,
      String offerCode,
      String eventAmenities) async {
    String res = "Some Information Regarding Event is Missing";
    try {
      String eventcPhoto = await StorageMethods()
          .uploadImageToStorage("eventCoverPhoto", eventCoverPhoto, true);
      String eventTicketPhoto = await StorageMethods()
          .uploadImageToStorage("eventTicketPhoto", eventPhoto, true);
      var uuid = Uuid().v4();
      EventModel postModel = EventModel(
          coupleValue: coupleValue,
          createOffer: createOffer,
          tables: tables,
          tickets: tickets,
          eventDescription: eventDescription,
          eventLocation: eventLocation,
          eventName: eventName,
          eventPhoto: eventTicketPhoto,
          eventType: eventType,
          timeDeadlineTicket: timeDeadlineTicket,
          toDate: toDate,
          uid: FirebaseAuth.instance.currentUser!.uid,
          eventDate: eventDate,
          fromTime: fromTime,
          offerCode: offerCode,
          nameOffer: nameOffer,
          eventAmenities: eventAmenities,
          eventCoverPhoto: eventcPhoto,
          uuid: uuid);

      ///Uploading Post To Firebase
      _firebaseFirestore.collection('events').doc(uuid).set(postModel.toJson());
      res = 'Successfully Event is Created';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}
