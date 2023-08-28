import 'package:cloud_firestore/cloud_firestore.dart';

class eventModel {
  String uid;
  String uuid;
  String eventDate;
  String fromTime;
  String eventName;
  String eventCoverPhoto;
  String eventPhoto;
  String eventType;
  String toDate;
  String eventLocation;
  String timeDeadlineTicket;
  String eventAmenities;
  String eventDescription;
  String coupleValue;
  String createOffer;
  String offerCode;

  String nameOffer;

  eventModel(
      {required this.uid,
      required this.eventDate,
      required this.fromTime,
      required this.offerCode,
      required this.nameOffer,
      required this.eventCoverPhoto,
      required this.uuid,
      required this.createOffer,
      required this.eventType,
      required this.coupleValue,
      required this.toDate,
      required this.eventDescription,
      required this.eventPhoto,
      required this.eventLocation,
      required this.eventAmenities,
      required this.timeDeadlineTicket,
      required this.eventName});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'eventName': eventName,
        'uid': uid,
        "uuid": "uuid",
        'eventDate': eventDate,
        'fromTime': fromTime,
        'eventType': eventType,
        'eventPhoto': eventPhoto,
        "nameOffer": nameOffer,
        'eventCoverPhoto': eventCoverPhoto,
        "coupleValue": coupleValue,
        "createOffer": createOffer,
        "eventDescription": eventDescription,
        'toDate': toDate,
        'eventLocation': eventLocation,
        "timeDeadlineTicket": timeDeadlineTicket,
        'eventAmenities': eventAmenities,
        "offerCode": offerCode,
      };

  ///
  static eventModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return eventModel(
        eventName: snapshot['eventName'],
        uid: snapshot['uid'],
        eventDate: snapshot['eventDate'],
        eventCoverPhoto: snapshot['eventCoverPhoto'],
        fromTime: snapshot['fromTime'],
        createOffer: snapshot['createOffer'],
        uuid: snapshot['uuid'],
        eventType: snapshot['eventType'],
        eventPhoto: snapshot['eventPhoto'],
        eventLocation: snapshot['eventLocation'],
        eventAmenities: snapshot['eventAmenities'],
        eventDescription: snapshot['eventDescription'],
        timeDeadlineTicket: snapshot['timeDeadlineTicket'],
        coupleValue: snapshot['coupleValue'],
        offerCode: snapshot['offerCode'],
        nameOffer: snapshot['nameOffer'],
        toDate: snapshot['toDate']);
  }
}
