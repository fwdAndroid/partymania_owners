import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/details/edit_event.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:share_plus/share_plus.dart';

class EventDetails extends StatefulWidget {
  final uuid;
  final artistType;
  final bird;
  final dayNight;
  var eventAmenities;
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
  var myTableList;
  var ticketdetail;

  EventDetails(
      {super.key,
      required this.artistType,
      required this.bird,
      required this.dayNight,
      required this.myTableList,
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
      required this.eventAmenities,
      required this.toEventDate,
      required this.totaltables,
      required this.uid,
      required this.uuid,
      required this.ticketdetail});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.eventAmenities.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 60,
                          height: 20,
                          decoration: BoxDecoration(
                            color: const Color(0xff4E4E4E),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xff4E4E4E),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              widget.eventAmenities[index].toString(),
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.7)),
                            ),
                          ),
                        ),
                      );
                    }),
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
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 114,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.ticketdetail.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: 120,
                          decoration: ShapeDecoration(
                            color:
                                Colors.white.withOpacity(0.03999999910593033),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFF4E4E4E)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/Frame 14418.png",
                                    height: 15,
                                    width: 15,
                                  ),
                                  Text(
                                    widget.ticketdetail[index]['couple'],
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(.7)),
                                  ),
                                ],
                              ),
                              Text(
                                widget.ticketdetail[index]['artist']
                                    .toString()
                                    .substring(7),
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.7)),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.ticketdetail[index]['eventTime'],
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(.7)),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(widget.ticketdetail[index]['timeBefore'],
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(.7))),
                                ],
                              ),
                              Divider(),
                              Text(
                                "RS " + widget.ticketdetail[index]['price'],
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
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

            //2bdsd
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 114,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.myTableList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: 120,
                          decoration: ShapeDecoration(
                            color:
                                Colors.white.withOpacity(0.03999999910593033),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFF4E4E4E)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.myTableList[index]['peopleNumber'],
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                widget.myTableList[index]['tableNo']
                                    .toString()
                                    .substring(8),
                                style: TextStyle(color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.myTableList[index]['tableNumber'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              Divider(),
                              Text(
                                "RS " + widget.myTableList[index]['tablePrice'],
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
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
                                    InkWell(
                                      onTap: () {
                                        Share.share(
                                            'Hey! Check out this Event!\n\nName : ${widget.eventName}');
                                      },
                                      child: Padding(
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
                                          offerCode: widget.offerCode,
                                          offerName: widget.offerName,
                                          uuid: widget.uuid,
                                          coverPhoto: widget.eventCoverPhoto,
                                          shortPhoto: widget.eventPhoto,
                                          eventName: widget.eventName,
                                          fromEventDate: widget.fromEventDate,
                                          toEventDate: widget.toEventDate,
                                          eventLocation: widget.eventLocation,
                                          numofpeople: widget.numofPeople,
                                          eventDescription:
                                              widget.eventDescription,
                                          eventAmenities: widget.eventAmenities,
                                          ticketdetail: widget.ticketdetail,
                                          myTableList: widget.myTableList,
                                          selectDate: widget.eventStartDate)));
                            }),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ));
  }
}
