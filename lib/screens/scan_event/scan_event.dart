import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/scan_event/scanning_page.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:scanning_effect/scanning_effect.dart';

class ScanEvent extends StatefulWidget {
  String name;
  final cost;
  String email;
  String bookinguuid;
  String phone;
  final seats;
  String uid;
  String eventUuid;

  ScanEvent(
      {super.key,
      required this.bookinguuid,
      required this.cost,
      required this.email,
      required this.eventUuid,
      required this.name,
      required this.phone,
      required this.seats,
      required this.uid});

  @override
  State<ScanEvent> createState() => _ScanEventState();
}

class _ScanEventState extends State<ScanEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: textColor),
          title: Text(
            "Ticket Information",
            style: TextStyle(
                color: textColor, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          backgroundColor: backgroundColor,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Divider(
              color: textColor,
              thickness: .3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    widget.email,
                    style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Divider(
              color: textColor,
              thickness: .3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Seats",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    widget.seats.toString(),
                    style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Divider(
              color: textColor,
              thickness: .3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cost",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    widget.cost.toString() + " RS",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Divider(
              color: textColor,
              thickness: .3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Booking ID",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    widget.bookinguuid.toString().substring(24),
                    style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SaveButton(
                  title: "Scan",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => ScanningPage()));
                  }),
            )
          ],
        ));
  }

  alert() {}
}
