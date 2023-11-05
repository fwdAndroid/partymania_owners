import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/details/event_details.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:image_network/image_network.dart';
import 'package:partymania_owners/webmodule/web_events/web_event_details.dart';

class WebHomeGridWidget extends StatefulWidget {
  const WebHomeGridWidget({super.key});

  @override
  State<WebHomeGridWidget> createState() => _WebHomeGridWidgetState();
}

class _WebHomeGridWidgetState extends State<WebHomeGridWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 290,
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("events")
                .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text(
                    "No Events Found yet",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return StreamBuilder<Object>(
                      stream: FirebaseFirestore.instance
                          .collection("events")
                          .where("uid",
                              isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                          .snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final List<DocumentSnapshot> documents =
                            snapshot.data!.docs;
                        final Map<String, dynamic> data =
                            documents[index].data() as Map<String, dynamic>;
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 220,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(color: textColor)),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) =>
                                                  WebEventDetails(
                                                    ticketdetail:
                                                        data['ticketdetail'],
                                                    myTableList:
                                                        data['tabledetail'],
                                                    eventAmenities:
                                                        data['eventAmenities'],
                                                    eventCoverPhoto:
                                                        data['eventCoverPhoto'],
                                                    eventDescription: data[
                                                        'eventDescription'],
                                                    eventLocation:
                                                        data['eventLocation'],
                                                    artistType:
                                                        data['artistType'],
                                                    bird: data['bird'],
                                                    dayNight: data['dayNight'],
                                                    eventName:
                                                        data['eventName'],
                                                    eventPhoto:
                                                        data['eventPhoto'],
                                                    eventStartDate:
                                                        data['eventStartDate'],
                                                    eventTicketPrice: data[
                                                        'eventTicketPrice'],
                                                    eventTicketSession: data[
                                                        'eventTicketSession'],
                                                    eventTicketTimeBefore: data[
                                                        'eventTicketTimeBefore'],
                                                    eventTotalTickets: data[
                                                        'eventTotalTickets'],
                                                    eventType:
                                                        data['eventType'],
                                                    uid: data['uid'],
                                                    uuid: data['uuid'],
                                                    fromEventDate:
                                                        data['fromEventDate'],
                                                    numofPeople:
                                                        data['numofPeople'],
                                                    offerCode:
                                                        data['offerCode'],
                                                    offerName:
                                                        data['offerName'],
                                                    participantType:
                                                        data['participantType'],
                                                    tableNumber:
                                                        data['tableNumber'],
                                                    tablePrice:
                                                        data['tablePrice']
                                                            .toString(),
                                                    tableType:
                                                        data['tableType'],
                                                    ticketPurchase:
                                                        data['ticketPurchase']
                                                            .toString(),
                                                    timeDeadlineTicket: data[
                                                        'timeDeadlineTicket'],
                                                    toEventDate:
                                                        data['toEventDate'],
                                                    totaltables:
                                                        data['totaltables']
                                                            .toString(),
                                                  )));
                                    },
                                    child: Container(
                                      height: 150,
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            child: Image.network(
                                              data['eventCoverPhoto'],
                                              height: 150,
                                              width: 180,
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional
                                                .bottomCenter,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        border: Border.all(
                                                            width: 1,
                                                            color: textColor
                                                                .withOpacity(
                                                                    .80))),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            data[
                                                                'eventStartDate'],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            data[
                                                                'fromEventDate'],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        border: Border.all(
                                                            width: 1,
                                                            color: textColor
                                                                .withOpacity(
                                                                    .80))),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        "4.9",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      data['eventName'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16)),
                                            border:
                                                Border.all(color: otpColor)),
                                        height: 30,
                                        width: 150,
                                        child: Center(
                                          child: Text(
                                            data['eventType'],
                                            style: TextStyle(color: otpColor),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          color: otpColor,
                                          size: 15,
                                        ),
                                        Text(
                                          data['eventLocation'],
                                          style: TextStyle(
                                              color: otpColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      },
                    );
                  });
            }));
  }
}
