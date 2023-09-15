import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_owners/utils/colors.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: textColor),
          title: Text(
            "Booking Details",
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.w500, fontSize: 16),
          ),
          backgroundColor: backgroundColor,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("booking")
                  .where("uid",
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "No Booking Found yet As User Booking Able you're able to scan",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return StreamBuilder<Object>(
                          stream: FirebaseFirestore.instance
                              .collection("booking")
                              .where("uid",
                                  isEqualTo:
                                      FirebaseAuth.instance.currentUser!.uid)
                              .snapshots(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
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
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
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
                                                    builder: (buil) =>
                                                        Booking()));
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (builder) =>
                                            //             ScanEvent()));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 6,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          16)),
                                                              border: Border.all(
                                                                  color:
                                                                      otpColor)),
                                                          height: 30,
                                                          width: 50,
                                                          child: Center(
                                                            child: Text(
                                                              data['eventType'],
                                                              style: TextStyle(
                                                                  color:
                                                                      otpColor),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          )),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Image.asset(
                                                        "assets/Auto Layout Horizontal.png",
                                                      )
                                                    ],
                                                  ),
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
                                                            BorderRadius
                                                                .circular(16),
                                                        border: Border.all(
                                                            width: 1,
                                                            color: textColor
                                                                .withOpacity(
                                                                    .80))),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text(
                                                          data[
                                                              'eventStartDate'],
                                                          style: TextStyle(
                                                              color: textColor
                                                                  .withOpacity(
                                                                      .6)),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text(
                                                          data['fromEventDate'],
                                                          style: TextStyle(
                                                              color: textColor
                                                                  .withOpacity(
                                                                      .6)),
                                                          textAlign:
                                                              TextAlign.center,
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
        ));
  }
}
