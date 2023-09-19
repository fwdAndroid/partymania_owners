import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/scan_event/scan_event.dart';
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
                  .collection("bookings")
                  .where("clubid",
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
                        "No Booking availble",
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
                              .collection("bookings")
                              .where("clubid",
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
                                    alignment: Alignment.center,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    data['name'],
                                                    style: TextStyle(
                                                        color: textColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 6,
                                                  ),
                                                  Container(
                                                    height: 40,
                                                    width: 200,
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
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.mobile_friendly,
                                                          color: textColor,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          data['phone'],
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
                                                  const SizedBox(
                                                    height: 6,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.chair,
                                                        color: otpColor,
                                                        size: 15,
                                                      ),
                                                      Text(
                                                        data['seats']
                                                            .toString(),
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
                                                    child: Text(
                                                      data['email'],
                                                      style: TextStyle(
                                                          color: textColor
                                                              .withOpacity(.6)),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (builder) =>
                                                                    ScanEvent(
                                                                      cost: data[
                                                                              'cost']
                                                                          .toString(),
                                                                      seats: data[
                                                                              'seats']
                                                                          .toString(),
                                                                      bookinguuid:
                                                                          data['bookinguuid']
                                                                              .toString(),
                                                                      name: data[
                                                                          'name'],
                                                                      phone: data[
                                                                          'phone'],
                                                                      email: data[
                                                                          'email'],
                                                                      eventUuid:
                                                                          data[
                                                                              'eventuuid'],
                                                                      uid: data[
                                                                          'uid'],
                                                                    )));
                                                  },
                                                  child: Text(
                                                    "Scan Ticket",
                                                    style: TextStyle(
                                                        color: otpColor),
                                                  ))
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
