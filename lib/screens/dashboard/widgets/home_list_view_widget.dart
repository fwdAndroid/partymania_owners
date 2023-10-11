import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/details/event_details.dart';
import 'package:partymania_owners/utils/colors.dart';

class HomeListViewWidget extends StatefulWidget {
  const HomeListViewWidget({super.key});

  @override
  State<HomeListViewWidget> createState() => _HomeListViewWidgetState();
}

class _HomeListViewWidgetState extends State<HomeListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
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
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                width: 235,
                                decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: textColor.withOpacity(.6))),
                                height: 130,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    EventDetails(
                                                      ticketdetail:
                                                          data['ticketdetail'],
                                                      myTableList:
                                                          data['tabledetail'],
                                                      eventAmenities: data[
                                                          'eventAmenities'],
                                                      eventCoverPhoto: data[
                                                          'eventCoverPhoto'],
                                                      eventDescription: data[
                                                          'eventDescription'],
                                                      eventLocation:
                                                          data['eventLocation'],
                                                      artistType:
                                                          data['artistType'],
                                                      bird: data['bird'],
                                                      dayNight:
                                                          data['dayNight'],
                                                      eventName:
                                                          data['eventName'],
                                                      eventPhoto:
                                                          data['eventPhoto'],
                                                      eventStartDate: data[
                                                          'eventStartDate'],
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
                                                      participantType: data[
                                                          'participantType'],
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.network(
                                                  data['eventCoverPhoto'],
                                                  width: 100,
                                                  height: 128,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data['eventName'],
                                                style: TextStyle(
                                                    color: textColor,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  16)),
                                                      border: Border.all(
                                                          color: otpColor)),
                                                  height: 30,
                                                  width: 150,
                                                  child: Center(
                                                    child: Text(
                                                      data['eventType'],
                                                      style: TextStyle(
                                                          color: otpColor),
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  )),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              Row(
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
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              Container(
                                                height: 20,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: textColor
                                                            .withOpacity(.80))),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      data['eventStartDate'],
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      data['fromEventDate'],
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )));
                      });
                });
          }),
    );
  }
}
