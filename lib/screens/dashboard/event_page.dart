import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/dashboard/widgets/event_list_widget.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Events",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colorBlack,
                  border: Border.all(color: Color(0xff7B7F91).withOpacity(.4))),
              margin: const EdgeInsets.only(left: 5, right: 5),
              child: TableCalendar(
                calendarStyle: CalendarStyle(
                    todayDecoration:
                        BoxDecoration(color: otpColor, shape: BoxShape.circle),
                    markerDecoration: BoxDecoration(color: Colors.white)),
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  "Events",
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
                  child: Text(
                    "4",
                    style: TextStyle(
                        color: textColor, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          EventListViewWidget(),
        ],
      ),
    );
  }
}
