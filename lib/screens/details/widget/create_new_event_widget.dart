import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:partymania_owners/screens/main_dashboard.dart';
import 'package:partymania_owners/services/database_methods.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/controllers.dart';
import 'package:partymania_owners/utils/image.dart';
import 'package:partymania_owners/utils/textformfield.dart';
import 'package:partymania_owners/utils/utils.dart';

enum Fruit { day, night, both }

enum Couples { Couple, Male, Female }

enum Artist { Guestlist, FullCover, NoCover }

enum TableNo { TableCharge, FullCover }

class CreateNewEventWidget extends StatefulWidget {
  const CreateNewEventWidget({super.key});

  @override
  State<CreateNewEventWidget> createState() => _CreateNewEventWidgetState();
}

class _CreateNewEventWidgetState extends State<CreateNewEventWidget> {
  Uint8List? eventCoverPhoto;
  Uint8List? eventPhoto;
  Fruit? _fruit = Fruit.day;
  Couples? _couples = Couples.Couple;
  TableNo? _tableNo = TableNo.TableCharge;
  Artist? _artist = Artist.Guestlist;
  TimeOfDay _selectedTime = TimeOfDay.now();
  String dropdownvalue = 'Before';
  bool _isLoading = false;

  // List of items in our dropdown menu
  var items = [
    'Before',
    'After',
  ];

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
              TextFormInputField(
                suIcon: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Image.asset(
                      "assets/Vector.png",
                      height: 10,
                      width: 10,
                    )),
                textInputType: TextInputType.text,
                hintText: "Event Type",
                controller: eventTypeController,
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: InkWell(
              onTap: () => showAlertDialog(),
              child: Image.asset(
                "assets/add.png",
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: InkWell(
              onTap: showAlertDialog2,
              child: Image.asset(
                "assets/add.png",
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
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

  void _selectFromTimeAlert() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        timeBeforeController.text = _selectedTime.format(context);
      });
    }
  }

  showAlertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.all(8),
          contentPadding: EdgeInsets.all(8),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          title: Text(
            'Add Ticket',
            style: TextStyle(color: colorBlack),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                              value: Couples.Couple,
                              groupValue: _couples,
                              onChanged: (Couples? value) {
                                setState(() {
                                  _couples = value;
                                });
                              }),
                          Expanded(
                              child: Text(
                            'Couples',
                            style: TextStyle(color: colorBlack),
                          ))
                        ],
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                              value: Couples.Male,
                              groupValue: _couples,
                              onChanged: (Couples? value) {
                                setState(() {
                                  _couples = value;
                                });
                              }),
                          Expanded(
                            child: Text(
                              'Male',
                              style: TextStyle(color: colorBlack),
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
                              value: Couples.Female,
                              groupValue: _couples,
                              onChanged: (Couples? value) {
                                setState(() {
                                  _couples = value;
                                });
                              }),
                          Expanded(
                              child: Text(
                            'Female',
                            style: TextStyle(color: colorBlack),
                          ))
                        ],
                      ),
                      flex: 1,
                    ),
                  ],
                ),
                //Artist
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                              value: Artist.Guestlist,
                              groupValue: _artist,
                              onChanged: (Artist? value) {
                                setState(() {
                                  _artist = value;
                                });
                              }),
                          Expanded(
                              child: Text(
                            'Guestlist',
                            style: TextStyle(color: colorBlack),
                          ))
                        ],
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                              value: Artist.FullCover,
                              groupValue: _artist,
                              onChanged: (Artist? value) {
                                setState(() {
                                  _artist = value;
                                });
                              }),
                          Expanded(
                            child: Text(
                              'Full Cover',
                              style: TextStyle(color: colorBlack),
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
                              value: Artist.NoCover,
                              groupValue: _artist,
                              onChanged: (Artist? value) {
                                setState(() {
                                  _artist = value;
                                });
                              }),
                          Expanded(
                              child: Text(
                            'No Cover',
                            style: TextStyle(color: colorBlack),
                          ))
                        ],
                      ),
                      flex: 1,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButton(
                        // Initial Value
                        value: dropdownvalue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Expanded(
                      child: TextFormInputField(
                        onTap: () {
                          _selectFromTimeAlert();
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
                        hintText: "9:30 AM",
                        controller: timeBeforeController,
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormInputField(
                          textInputType: TextInputType.number,
                          hintText: "Total Tickets",
                          controller: totalTicketsController,
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: TextFormInputField(
                          textInputType: TextInputType.number,
                          hintText: "Price",
                          controller: priceController,
                        ),
                      ),
                    ],
                  ),
                ),
                SaveButton(
                    title: "Add",
                    onTap: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        );
      },
    );
  }

  showAlertDialog2() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.all(8),
          contentPadding: EdgeInsets.all(8),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          title: Text(
            'Add Table',
            style: TextStyle(color: colorBlack),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormInputField(
                  textInputType: TextInputType.number,
                  hintText: "Enter Table Number",
                  controller: tableNumberController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                              value: TableNo.TableCharge,
                              groupValue: _tableNo,
                              onChanged: (TableNo? value) {
                                setState(() {
                                  _tableNo = value;
                                });
                              }),
                          Expanded(
                              child: Text(
                            'Table Charge',
                            style: TextStyle(color: colorBlack),
                          ))
                        ],
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                              value: TableNo.FullCover,
                              groupValue: _tableNo,
                              onChanged: (TableNo? value) {
                                setState(() {
                                  _tableNo = value;
                                });
                              }),
                          Expanded(
                            child: Text(
                              'Full Cover',
                              style: TextStyle(color: colorBlack),
                            ),
                          )
                        ],
                      ),
                      flex: 1,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormInputField(
                          textInputType: TextInputType.number,
                          hintText: "Number of People",
                          controller: peopleController,
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: TextFormInputField(
                          textInputType: TextInputType.number,
                          hintText: "Type of Table",
                          controller: tableType,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormInputField(
                          textInputType: TextInputType.number,
                          hintText: "Number of People",
                          controller: peopleController,
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: TextFormInputField(
                          textInputType: TextInputType.number,
                          hintText: "Type of Table",
                          controller: tableType,
                        ),
                      ),
                    ],
                  ),
                ),
                SaveButton(title: "Add", onTap: () {})
              ],
            ),
          ),
        );
      },
    );
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
    String rse = await FirebaseMethods().createEvent(
        eventNameController.text,
        selectDate.text,
        fromDateController.text,
        "createOffer",
        eventTypeController.text,
        eventCoverPhoto!,
        eventPhoto!,
        eventdescriptionController.text,
        FirebaseAuth.instance.currentUser!.uid,
        eventLocationController.text,
        ticketPurchaseDeadlineController.text,
        toDateController.text,
        offerNameController.text,
        _fruit.toString(),
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
