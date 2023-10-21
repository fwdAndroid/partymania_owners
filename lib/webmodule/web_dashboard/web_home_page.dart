import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:partymania_owners/screens/dashboard/widgets/home_grid_widget.dart';
import 'package:partymania_owners/screens/dashboard/widgets/home_list_view_widget.dart';
import 'package:partymania_owners/screens/event_near_by_frame.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/webmodule/events/web_create_event.dart';
import 'package:partymania_owners/webmodule/events/widget/web_grid_widget.dart';

class WebHomePage extends StatefulWidget {
  const WebHomePage({super.key});

  @override
  State<WebHomePage> createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                Color(0xff823DD8),
                Color(0xff803DDA),
                Color(0xffF80354)
              ])),
          width: 120,
          height: 36,
          child: FloatingActionButton.extended(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => WebCreateEvent()));
            },
            icon: Icon(Icons.event),
            label: Text('Create Event'),
          )),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            "assets/logo.svg",
            width: 33,
            height: 30,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (builder) => EventNearByYourFrame()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/notification.svg",
                width: 33,
                height: 30,
              ),
            ),
          )
        ],
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text(
                          "Ongoing Events",
                          style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: otpColor,
                          ),
                          child: FutureBuilder(
                              future: docss(),
                              builder: (context, snapshot) {
                                return Text(
                                  snapshot.data.toString(),
                                  style: TextStyle(
                                      color: textColor,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => EventNearByYourFrame()));
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 12,
                            color: textColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            HomeListViewWidget(),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text(
                          "Upcomming Events",
                          style: TextStyle(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: otpColor,
                          ),
                          child: FutureBuilder(
                              future: docss(),
                              builder: (context, snapshot) {
                                return Text(
                                  snapshot.data.toString(),
                                  style: TextStyle(
                                      color: textColor,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => EventNearByYourFrame()));
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 12,
                            color: textColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            WebHomeGridWidget()
          ],
        ),
      ),
    );
  }

  docss() async {
    AggregateQuerySnapshot query = await FirebaseFirestore.instance
        .collection('events')
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .count()
        .get();

    int numberOfDocuments = query.count;
    return numberOfDocuments;
  }
}
