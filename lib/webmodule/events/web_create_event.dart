import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/details/widget/create_new_event_widget.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/webmodule/events/widget/web_create_new_event_widget.dart';

class WebCreateEvent extends StatefulWidget {
  const WebCreateEvent({super.key});

  @override
  State<WebCreateEvent> createState() => _WebCreateEventState();
}

class _WebCreateEventState extends State<WebCreateEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Create New Event",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(child: WebCreateNewEventWidget())
            ],
          ),
        ),
      ),
    );
  }
}
