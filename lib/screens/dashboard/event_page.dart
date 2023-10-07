import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/dashboard/widgets/event_list_widget.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  String selectedDate = '';
  String dateCount = '';
  String range = '';
  String rangeCount = '';

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        dateCount = args.value.length.toString();
      } else {
        rangeCount = args.value.length.toString();
      }
    });
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
              child: SfDateRangePicker(
                onSelectionChanged: _onSelectionChanged,
                todayHighlightColor: Colors.pink,
                showTodayButton: true,
                selectionColor: Colors.pink,
                selectionMode: DateRangePickerSelectionMode.single,
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
                  child: FutureBuilder(
                      future: docss(),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data.toString(),
                          style: TextStyle(
                              color: textColor, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        );
                      }),
                )
              ],
            ),
          ),
          // EventListViewWidget(),
        ],
      ),
    );
  }
}
