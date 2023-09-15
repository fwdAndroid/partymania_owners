import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/details/edit_event.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';

class EventDetails extends StatefulWidget {
  final uuid;
  final artistType;
  final bird;
  final dayNight;
  final eventAmenities;
  final eventCoverPhoto;
  final eventDescription;
  final eventLocation;
  final eventName;
  final eventPhoto;
  final eventStartDate;
  final eventTicketPrice;
  final eventTicketSession;
  final eventTicketTimeBefore;
  final eventTotalTickets;
  final eventType;
  final fromEventDate;
  final numofPeople;
  final offerCode;
  final offerName;
  final participantType;
  final tableNumber;
  final tablePrice;
  final tableType;
  final ticketPurchase;
  final timeDeadlineTicket;
  final toEventDate;
  final totaltables;
  final uid;

  EventDetails({
    super.key,
    required this.artistType,
    required this.bird,
    required this.dayNight,
    required this.eventAmenities,
    required this.eventCoverPhoto,
    required this.eventDescription,
    required this.eventLocation,
    required this.eventName,
    required this.eventPhoto,
    required this.eventStartDate,
    required this.eventTicketPrice,
    required this.eventTicketSession,
    required this.eventTicketTimeBefore,
    required this.eventTotalTickets,
    required this.eventType,
    required this.fromEventDate,
    required this.numofPeople,
    required this.offerCode,
    required this.offerName,
    required this.participantType,
    required this.tableNumber,
    required this.tablePrice,
    required this.tableType,
    required this.ticketPurchase,
    required this.timeDeadlineTicket,
    required this.toEventDate,
    required this.totaltables,
    required this.uid,
    required this.uuid,
  });

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                widget.eventCoverPhoto,
                height: 240,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.eventName,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     widget.eventName,
            //     style: TextStyle(
            //         color: textColor,
            //         fontWeight: FontWeight.w400,
            //         fontSize: 12),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: [
            //       Container(
            //         width: 50,
            //         height: 26,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //           border: Border.all(
            //             color: textColor.withOpacity(.8),
            //           ),
            //         ),
            //         child: Center(
            //           child: Text(
            //             "Music",
            //             style: TextStyle(color: textColor.withOpacity(.6)),
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Container(
            //         width: 50,
            //         height: 26,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //           border: Border.all(
            //             color: textColor.withOpacity(.8),
            //           ),
            //         ),
            //         child: Center(
            //           child: Text(
            //             "Night",
            //             style: TextStyle(color: textColor.withOpacity(.6)),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.asset("assets/Group 14427.png"),
                title: Text(
                  "20% OFF",
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Use Code",
                        style: TextStyle(
                            color: textColor.withOpacity(.7),
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.offerName,
                        style: TextStyle(
                            color: textColor.withOpacity(.7),
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.asset("assets/s.png"),
                title: Text(
                  widget.eventStartDate,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                subtitle: Text(
                  widget.eventTicketTimeBefore,
                  style: TextStyle(
                      color: textColor.withOpacity(.7),
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.asset("assets/Group 14428.png"),
                title: Text(
                  widget.eventLocation,
                  style: TextStyle(
                      color: textColor.withOpacity(.7),
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Amenities",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color(0xff4E4E4E),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xff4E4E4E),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        widget.eventAmenities,
                        style: TextStyle(color: textColor.withOpacity(.6)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "About Event",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.eventDescription,
                style: TextStyle(
                    color: textColor.withOpacity(.7),
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Tickets and Payment",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Ticket Available",
                          style: TextStyle(
                              color: textColor.withOpacity(.7),
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.eventTotalTickets,
                          style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Purchase Deadline",
                          style: TextStyle(
                              color: textColor.withOpacity(.7),
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.timeDeadlineTicket,
                          style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 136,
                height: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: textColor, width: .5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/Frame 14418.png",
                            height: 24,
                            width: 24,
                          ),
                          Text(
                            widget.bird,
                            style: TextStyle(
                                color: textColor.withOpacity(.7),
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            widget.artistType.toString().substring(7),
                            style: TextStyle(
                                color: textColor.withOpacity(.7),
                                fontWeight: FontWeight.w400,
                                fontSize: 10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.eventTicketSession,
                                style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.eventTicketTimeBefore,
                                style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        color: textColor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "RS ",
                          style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.eventTicketPrice.toString(),
                          style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Table and Blueprint",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Ticket Available",
                          style: TextStyle(
                              color: textColor.withOpacity(.7),
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.eventTotalTickets,
                          style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            //2bdsd
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 136,
                height: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: textColor, width: .5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Table 1 for 6 people",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 50,
                        height: 26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: textColor.withOpacity(.8),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            widget.eventType,
                            style: TextStyle(color: textColor.withOpacity(.6)),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.eventTicketSession,
                              style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.eventTicketTimeBefore,
                              style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        color: textColor,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "RS ",
                              style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              widget.eventTicketPrice.toString(),
                              style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //2bdsd

            Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Wrap(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                          child: Text(
                                        "Share",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/Group 14436.png",
                                            width: 40,
                                            height: 50,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            "assets/Twitter.png",
                                            width: 40,
                                            height: 50,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            "assets/Instagram.png",
                                            width: 40,
                                            height: 50,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Image.asset(
                                            "assets/LinkedIn.png",
                                            width: 40,
                                            height: 50,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            "assets/WhatsApp.png",
                                            width: 40,
                                            height: 50,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            "assets/Facebook.png",
                                            width: 40,
                                            height: 50,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Image.asset(
                          "assets/share.png",
                          height: 48,
                          width: 48,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 270,
                        child: SaveButton(
                            title: "Edit Event",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => EditEvent(
                                            uuid: widget.uuid,
                                          )));
                            }),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
