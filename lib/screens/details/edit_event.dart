import 'package:flutter/material.dart';
import 'package:partymania_owners/utils/colors.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({super.key});

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text(
            "Payment",
            style: TextStyle(color: textColor),
          ),
          automaticallyImplyLeading: false,
        ),
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ticket classique x1",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "\$ 20.00",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                child: Divider(
                  color: Color(0xff94999E),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "GST/QST",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "\$ 2.60",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                child: Divider(
                  color: Color(0xff94999E),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "\$ 22.60",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                child: Divider(
                  color: Color(0xff94999E),
                ),
              ),
            ],
          ),
        ));
  }
}
