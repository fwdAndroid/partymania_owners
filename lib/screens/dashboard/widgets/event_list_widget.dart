import 'package:flutter/material.dart';
import 'package:partymania_owners/utils/colors.dart';

class EventListViewWidget extends StatefulWidget {
  const EventListViewWidget({super.key});

  @override
  State<EventListViewWidget> createState() => _EventListViewWidgetState();
}

class _EventListViewWidgetState extends State<EventListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    width: 235,
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: textColor.withOpacity(.6))),
                    height: 130,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (builder) => EventDetails()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      "assets/main.png",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Holy Night",
                                    style: TextStyle(
                                        color: textColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(16)),
                                              border:
                                                  Border.all(color: otpColor)),
                                          height: 30,
                                          width: 50,
                                          child: Center(
                                            child: Text(
                                              "Music",
                                              style: TextStyle(color: otpColor),
                                              textAlign: TextAlign.center,
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
                                        "Orilla, Pune",
                                        style: TextStyle(
                                            color: otpColor,
                                            fontWeight: FontWeight.w400,
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
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                            width: 1,
                                            color: textColor.withOpacity(.80))),
                                    child: Text(
                                      "20 Dec, 9:00pm",
                                      style: TextStyle(
                                          color: textColor.withOpacity(.6)),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )));
          }),
    );
  }
}
