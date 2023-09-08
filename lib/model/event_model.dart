import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
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
  final coupleValue;
  String createOffer;
  String offerCode;
  final tickets;
  final tables;

  String nameOffer;

  EventModel(
      {required this.uid,
      required this.eventDate,
      required this.fromTime,
      required this.offerCode,
      required this.nameOffer,
      required this.tables,
      required this.tickets,
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
        "tickets": tickets,
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
        "tables": tables
      };

  ///
  static EventModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return EventModel(
        eventName: snapshot['eventName'],
        tables: snapshot['tables'],
        tickets: snapshot['tickets'],
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
