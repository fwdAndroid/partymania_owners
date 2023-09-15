import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/details/widget/update_new_event_widget.dart';
import 'package:partymania_owners/utils/colors.dart';

class EditEvent extends StatefulWidget {
  final uuid;
  const EditEvent({super.key, required this.uuid});

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.uuid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Update Event",
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
              UpdateNewEventWidget(
                uuid: widget.uuid,
              )
            ],
          ),
        ),
      ),
    );
  }
}
