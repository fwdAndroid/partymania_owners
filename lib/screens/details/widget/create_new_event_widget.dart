import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:partymania_owners/screens/details/widget/tickets_payments_alerts.dart';
import 'package:partymania_owners/screens/details/widget/upload_tables_widget_alert.dart';
import 'package:partymania_owners/screens/main_dashboard.dart';
import 'package:partymania_owners/services/database_methods.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/controllers.dart';
import 'package:partymania_owners/utils/droplist.dart';
import 'package:partymania_owners/utils/image.dart';
import 'package:partymania_owners/utils/textformfield.dart';
import 'package:partymania_owners/utils/utils.dart';

enum Fruit { day, night, both }

class CreateNewEventWidget extends StatefulWidget {
  const CreateNewEventWidget({super.key});

  @override
  State<CreateNewEventWidget> createState() => _CreateNewEventWidgetState();
}

class _CreateNewEventWidgetState extends State<CreateNewEventWidget> {
  Uint8List? eventCoverPhoto;
  Uint8List? eventPhoto;
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool _isLoading = false;

  List emptytickets = [];
  List emptytables = [];
  // List of items in our dropdown menu

  Fruit? _fruit = Fruit.day;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: eventCoverPhoto != null
                    ? Image.memory(
                        eventCoverPhoto!,
                        width: 335,
                        height: 160,
                        fit: BoxFit.fill,
                      )
                    : InkWell(
                        onTap: () => selectEventImage(),
                        child: Image.asset("assets/img.png")),
              ),
              eventPhoto != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.memory(
                        eventPhoto!,
                        width: 80,
                        height: 80,
                      ))
                  : InkWell(
                      onTap: () => eventPhotos(),
                      child: Image.asset(
                        "assets/add.png",
                        width: 80,
                        height: 80,
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Event Details",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Radio(
                            value: Fruit.day,
                            groupValue: _fruit,
                            onChanged: (Fruit? value) {
                              setState(() {
                                _fruit = value;
                              });
                            }),
                        Expanded(
                          child: Text(
                            'Day',
                            style: TextStyle(color: textColor),
                          ),
                        )
                      ],
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Radio(
                            value: Fruit.night,
                            groupValue: _fruit,
                            onChanged: (Fruit? value) {
                              setState(() {
                                _fruit = value;
                              });
                            }),
                        Expanded(
                            child: Text(
                          'Night',
                          style: TextStyle(color: textColor),
                        ))
                      ],
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Radio(
                            value: Fruit.both,
                            groupValue: _fruit,
                            onChanged: (Fruit? value) {
                              setState(() {
                                _fruit = value;
                              });
                            }),
                        Expanded(
                            child: Text(
                          'Both',
                          style: TextStyle(color: textColor),
                        ))
                      ],
                    ),
                    flex: 1,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Event Name",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormInputField(
                textInputType: TextInputType.text,
                hintText: "Event Name",
                controller: eventNameController,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Event Type",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 65,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: borderColor.withOpacity(.4), width: 1),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: DropdownButton(
                      // Initial Value
                      value: eventTypeList,
                      underline: SizedBox(),
                      isDense: true,
                      dropdownColor: Colors.black,
                      isExpanded: true,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: eventItems.map((String eventItems) {
                        return DropdownMenuItem(
                          value: eventItems,
                          child: Text(
                            eventItems,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: textColor),
                          ),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          eventTypeList = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Date",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormInputField(
                onTap: () {
                  _selectDate();
                },
                suIcon: Icon(
                  Icons.calendar_month,
                  color: textColor,
                ),
                textInputType: TextInputType.datetime,
                hintText: "Select Date",
                controller: selectDate,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Time",
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormInputField(
                      onTap: () {
                        _selectFromTime();
                      },
                      suIcon: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Image.asset(
                          "assets/clock.png",
                          width: 10,
                          height: 10,
                        ),
                      ),
                      textInputType: TextInputType.text,
                      hintText: "From",
                      controller: fromDateController,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "",
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormInputField(
                      onTap: () {
                        _selectToTime();
                      },
                      suIcon: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Image.asset(
                          "assets/clock.png",
                          width: 10,
                          height: 10,
                        ),
                      ),
                      textInputType: TextInputType.text,
                      hintText: "To",
                      controller: toDateController,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Location",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormInputField(
                suIcon: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Image.asset(
                    "assets/location.png",
                    width: 10,
                    height: 10,
                  ),
                ),
                textInputType: TextInputType.text,
                hintText: "Eden Garden",
                controller: eventLocationController,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About Event",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,
                child: TextFormInputField(
                  maxLines: 5,
                  textInputType: TextInputType.text,
                  hintText: "Type Something",
                  controller: eventdescriptionController,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Amenities",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormInputField(
                suIcon: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            backgroundColor: otpColor),
                        onPressed: () {},
                        child: Text(
                          "Add",
                          style: TextStyle(color: textColor),
                        ))),
                textInputType: TextInputType.text,
                hintText: "Add Amenities",
                controller: eventamenitiesController,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Tickets and Payments",
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
        ),
        TicketsAndPaymentsAlerts(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ticket Purchase Deadline",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormInputField(
                onTap: _selectDate2,
                suIcon: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Icon(
                      Icons.calendar_month,
                      color: textColor,
                    )),
                textInputType: TextInputType.text,
                hintText: "Choose a Ticket Purchase Deadline",
                controller: ticketPurchaseDeadlineController,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Table and Blueprint",
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload Tables Blueprint",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormInputField(
                suIcon: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            backgroundColor: otpColor),
                        onPressed: () {},
                        child: Text(
                          "Upload",
                          style: TextStyle(color: textColor),
                        ))),
                textInputType: TextInputType.text,
                hintText: "12.jpg",
                controller: ticketPurchaseUploadController,
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        UploadTablesAlerts(),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Create Offer",
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Offer Name",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormInputField(
                textInputType: TextInputType.text,
                hintText: "12255",
                controller: offerNameController,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Offer Code",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormInputField(
                textInputType: TextInputType.text,
                hintText: "12255",
                controller: offerCodeController,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Terms & Condition",
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormInputField(
            suIcon: Padding(
                padding: const EdgeInsets.all(13.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        backgroundColor: otpColor),
                    onPressed: () {},
                    child: Text(
                      "Upload",
                      style: TextStyle(color: textColor),
                    ))),
            textInputType: TextInputType.text,
            hintText: "Type Terms & Condition",
            controller: termsController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center(
                      child: SaveButton(
                        title: "Publish Event",
                        onTap: () => createEvent(),
                      ),
                    ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }

  //Functions
  void _selectDate() async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    ).then((selectedDate) {
      if (selectedDate != null) {
        selectDate.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      }
    });
  }

  void _selectDate2() async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    ).then((selectedDate) {
      if (selectedDate != null) {
        ticketPurchaseDeadlineController.text =
            DateFormat('yyyy-MM-dd').format(selectedDate);
      }
    });
  }

  void _selectFromTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        fromDateController.text = _selectedTime.format(context);
      });
    }
  }

  void _selectToTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        toDateController.text = _selectedTime.format(context);
      });
    }
  }

  selectEventImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      eventCoverPhoto = ui;
    });
  }

  eventPhotos() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      eventPhoto = ui;
    });
  }

  createEvent() async {
    setState(() {
      _isLoading = true;
    });
    if (eventNameController.text.isEmpty ||
        eventLocationController.text.isEmpty ||
        fromDateController.text.isEmpty ||
        selectDate.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No Event Create Fields are Required")));
      Navigator.pop(context);
    } else {
      String rse = await FirebaseMethods().createEvent(
          eventNameController.text,
          selectDate.text,
          fromDateController.text,
          "createOffer",
          eventTypeList,
          eventCoverPhoto!,
          eventPhoto!,
          eventdescriptionController.text,
          FirebaseAuth.instance.currentUser!.uid,
          eventLocationController.text,
          ticketPurchaseDeadlineController.text,
          toDateController.text,
          offerNameController.text,
          _fruit.toString(),
          [],
          [],
          offerCodeController.text,
          eventamenitiesController.text);

      print(rse);
      setState(() {
        _isLoading = false;
      });
      if (rse == 'sucess') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (builder) => MainScreen()));
      } else {
        showSnakBar(rse, context);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (builder) => MainScreen()));
      }
    }
  }
}
