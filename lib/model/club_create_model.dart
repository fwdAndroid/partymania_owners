import 'package:cloud_firestore/cloud_firestore.dart';

class ClubModel {
  String uid;
  String clubLocation;
  String clubPhoneNumber;
  String clubName;
  String coverPhoto;
  String ticketPhoto;
  String clubType;
  String clubState;
  String clubCity;
  String clubCountry;
  String clubZipCode;
  var clubAmentities;
  String clubDescription;
  final followers;
  int rating;

  ClubModel(
      {required this.uid,
      required this.clubLocation,
      required this.clubPhoneNumber,
      required this.coverPhoto,
      required this.followers,
      required this.rating,
      required this.clubType,
      required this.clubState,
      required this.clubDescription,
      required this.ticketPhoto,
      required this.clubCity,
      required this.clubCountry,
      required this.clubAmentities,
      required this.clubZipCode,
      required this.clubName});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'clubName': clubName,
        'uid': uid,
        'clubLocation': clubLocation,
        'clubPhoneNumber': clubPhoneNumber,
        'clubType': clubType,
        'clubCountry': clubCountry,
        'ticketPhoto': ticketPhoto,
        'coverPhoto': coverPhoto,
        "clubDescription": clubDescription,
        'clubState': clubState,
        'clubCity': clubCity,
        "clubZipCode": clubZipCode,
        "rating": rating,
        "followers": followers,
        'clubAmentities': clubAmentities,
      };

  ///
  static ClubModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return ClubModel(
        clubName: snapshot['clubName'],
        uid: snapshot['uid'],
        clubLocation: snapshot['clubLocation'],
        coverPhoto: snapshot['coverPhoto'],
        rating: snapshot['rating'],
        clubPhoneNumber: snapshot['clubPhoneNumber'],
        clubType: snapshot['clubType'],
        clubCountry: snapshot['clubCountry'],
        followers: snapshot['followers'],
        ticketPhoto: snapshot['ticketPhoto'],
        clubCity: snapshot['clubCity'],
        clubAmentities: snapshot['clubAmentities'],
        clubDescription: snapshot['clubDescription'],
        clubZipCode: snapshot['clubZipCode'],
        clubState: snapshot['clubState']);
  }
}
