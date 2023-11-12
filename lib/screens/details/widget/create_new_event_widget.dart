import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:partymania_owners/services/storage_methods.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/controllers.dart';
import 'package:partymania_owners/utils/droplist.dart';
import 'package:partymania_owners/utils/image.dart';
import 'package:partymania_owners/utils/textformfield.dart';
import 'package:partymania_owners/utils/utils.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

enum Fruit { day, night, both }

enum Artist { Guestlist, FullCover, NoCover }

enum TableNo { TableCharge, FullCover }

class CreateNewEventWidget extends StatefulWidget {
  const CreateNewEventWidget({super.key});

  @override
  State<CreateNewEventWidget> createState() => _CreateNewEventWidgetState();
}

class _CreateNewEventWidgetState extends State<CreateNewEventWidget> {
  Uint8List? eventCoverPhoto;
  Fruit? _fruit = Fruit.day;
  Artist? _artist = Artist.Guestlist;
  Uint8List? eventTable;

  TableNo? _tableNo = TableNo.TableCharge;
  bool _isLoading = false;

  TimeOfDay _selectedTime = TimeOfDay.now();
  TimeOfDay _selectedTimeFrom = TimeOfDay.now();
  var items = [
    'Before',
    'After',
  ];

  String dropdownvalue = 'Before';
  var uuid = Uuid().v4();
  List<String> values = [];
  List<Map<String, dynamic>> itemList = [];
  List<Map<String, dynamic>> tableList = [];

  void addToStringList(String text) {
    setState(() {
      values.add(text);
      eventamenitiesController.clear();
    });
  }

  bool uploading = false;
  double val = 0;
  CollectionReference? imgRef;
  firebase_storage.Reference? ref;

  List<File> _image = [];
  final picker = ImagePicker();

  final _formKey = GlobalKey<FormState>();
  String inputText = "Field is Required";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  chooseImage();
                },
                child: Image.asset(
                  "assets/add.png",
                  width: 80,
                  height: 80,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _image.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.file(
                                File(_image[index].path),
                                fit: BoxFit.cover,
                                height: 80,
                                width: 80,
                              )),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Text(
            "Event Details",
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.w600, fontSize: 18),
          ),
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
                validat: (value) {
                  if (value.isEmpty) {
                    return 'Field is Required';
                  }
                  return null;
                },
                onSaved: (p0) {
                  inputText = p0!;
                },
              ),
              SizedBox(
                height: 10,
              ),
              Column(
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
                    width: 330,
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
              SizedBox(
                height: 5,
              ),
              Column(
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
                    onTap: () async {
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2025),
                      ).then((selectedDate) {
                        if (selectedDate != null) {
                          selectDate.text =
                              DateFormat('yyyy-MM-dd').format(selectedDate);
                        }
                      });
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
                      onTap: () async {
                        final TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: _selectedTimeFrom,
                        );

                        if (picked != null && picked != _selectedTimeFrom) {
                          setState(() {
                            _selectedTimeFrom = picked;
                            fromDateController.text =
                                _selectedTimeFrom.format(context);
                          });
                        }
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
                      onTap: () async {
                        final TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: _selectedTime,
                        );

                        if (picked != null && picked != _selectedTime) {
                          setState(() {
                            _selectedTime = picked;
                            toDateController.text =
                                _selectedTime.format(context);
                          });
                        }
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
                validat: (value) {
                  if (value.isEmpty) {
                    return 'Event Location is Required.';
                  }
                  return null;
                },
                onSaved: (p0) {
                  inputText = p0!;
                },
                textInputType: TextInputType.text,
                hintText: "Enter Address",
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
                  validat: (value) {
                    if (value.isEmpty) {
                      return 'Event Description is Required.';
                    }
                    return null;
                  },
                  onSaved: (p0) {
                    inputText = p0!;
                  },
                  textInputType: TextInputType.text,
                  hintText: "Type Something",
                  controller: eventdescriptionController,
                ),
              ),
            ],
          ),
        ),
        Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: buildStringList()),
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
                validat: (value) {
                  if (value.isEmpty) {
                    return 'Event Amenities is Required.';
                  }
                  return null;
                },
                onSaved: (p0) {
                  inputText = p0!;
                },
                suIcon: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            backgroundColor: otpColor),
                        onPressed: () {
                          String text = eventamenitiesController.text;
                          if (text.isNotEmpty) {
                            addToStringList(text);
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Values are Added")));
                        },
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
          child: Text(
            "Tickets and Payments",
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
        ExpansionTile(
          title: Text(
            "Upload Tickets",
            style: TextStyle(color: textColor),
          ),
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Add Ticket",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 11, right: 11),
              height: 45,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: textColor.withOpacity(.4), width: 1),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: DropdownButton(
                    // Initial Value
                    value: couplesDropDown,
                    underline: SizedBox(),
                    isDense: true,
                    dropdownColor: Colors.black,
                    isExpanded: true,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: itemsCouples.map((String itemsCouples) {
                      return DropdownMenuItem(
                        value: itemsCouples,
                        child: Text(
                          itemsCouples,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: textColor),
                        ),
                      );
                    }).toList(),

                    onChanged: (String? newValue) {
                      setState(() {
                        couplesDropDown = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              decoration: BoxDecoration(
                  border:
                      Border.all(color: textColor.withOpacity(.4), width: 1),
                  borderRadius: BorderRadius.circular(12)),
              child: TextFormField(
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: textColor),
                    hintText: "Description (Optional)"),
                controller: birdController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        style: TextStyle(color: textColor),
                      ))
                    ],
                  ),
                  flex: 1,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: textColor.withOpacity(.4), width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: DropdownButton(
                          dropdownColor: Colors.black,
                          // Initial Value
                          value: dropdownvalue,
                          underline: SizedBox(),
                          isDense: true,
                          isExpanded: true,
                          // Down Arrow Icon
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: textColor,
                          ),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(color: textColor),
                              ),
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
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: textColor.withOpacity(.4), width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: TextFormField(
                        style: TextStyle(color: textColor),
                        onTap: () async {
                          final TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: _selectedTime,
                          );

                          if (picked != null && picked != _selectedTime) {
                            setState(() {
                              _selectedTime = picked;
                              timeBeforeController.text =
                                  _selectedTime.format(context);
                            });
                          }
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Icon(
                                Icons.timer,
                                color: textColor,
                              ),
                            ),
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: textColor),
                            hintText: "9:30 AM"),
                        controller: timeBeforeController,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 12, right: 12, top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: textColor.withOpacity(.4), width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: TextFormField(
                        style: TextStyle(color: textColor),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            border: InputBorder.none,
                            hintText: "Total Tickets",
                            hintStyle: TextStyle(color: textColor)),
                        controller: totalTicketsController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: textColor.withOpacity(.4), width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: TextFormField(
                        style: TextStyle(color: textColor),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            border: InputBorder.none,
                            hintText: "Price",
                            hintStyle: TextStyle(color: textColor)),
                        controller: priceController,
                        keyboardType: TextInputType.number,
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
                    "Ticket Purchase Deadline",
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: textColor.withOpacity(.4), width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      style: TextStyle(color: textColor),
                      onTap: () async {
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
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, top: 10),
                        border: InputBorder.none,
                        hintText: "Choose a Ticket Purchase Deadline",
                        hintStyle: TextStyle(color: textColor),
                        suffixIcon: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Icon(
                              Icons.calendar_month,
                              color: textColor,
                            )),
                      ),
                      controller: ticketPurchaseDeadlineController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SaveButton(
                        title: "Add",
                        onTap: () {
                          if (ticketPurchaseDeadlineController.text.isEmpty) {
                            showSnakBar("Ticket Purchase is Required", context);
                          } else if (timeBeforeController.text.isEmpty) {
                            showSnakBar("Time Selection is Required", context);
                          } else if (totalTicketsController.text.isEmpty) {
                            showSnakBar("Tickets are required", context);
                          } else if (priceController.text.isEmpty) {
                            showSnakBar("Price is Required", context);
                          } else {
                            itemList.add({
                              "couple": couplesDropDown,
                              "bird": birdController.text ?? "",
                              "artist": _artist.toString(),
                              "ticketDeadline":
                                  ticketPurchaseDeadlineController.text,
                              "price": priceController.text,
                              "timeBefore": timeBeforeController.text,
                              "totalTickets": totalTicketsController.text,
                              "eventTime": dropdownvalue,
                            });

                            print(itemList);
                            birdController.clear();
                            timeBeforeController.clear();
                            ticketPurchaseDeadlineController.clear();
                            priceController.clear();
                            setState(() {});

                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Tickets are Added")));
                          }
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
        itemList.isEmpty
            ? Container()
            : Container(
                width: MediaQuery.of(context).size.width,
                height: 114,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: itemList.length,
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
                                itemList[index]['couple'],
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                itemList[index]['artist']
                                    .toString()
                                    .substring(7),
                                style: TextStyle(color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    itemList[index]['eventTime'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    itemList[index]['timeBefore'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Divider(),
                              Text(
                                "RS " + itemList[index]['price'],
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
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
              eventTable != null
                  ? Image.memory(
                      eventTable!,
                      width: 335,
                      height: 160,
                      fit: BoxFit.fill,
                    )
                  : TextFormInputField(
                      suIcon: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  backgroundColor: otpColor),
                              onPressed: () => selectEventTableImage(),
                              child: Text(
                                "Upload",
                                style: TextStyle(color: textColor),
                              ))),
                      textInputType: TextInputType.text,
                      hintText: "12.jpg",
                      controller: ticketPurchaseUploadController,
                    ),
              ExpansionTile(
                title: Text(
                  "Upload Table",
                  style: TextStyle(color: textColor),
                ),
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Add Tables",
                        style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: textColor.withOpacity(.4), width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: TextFormField(
                      style: TextStyle(color: textColor),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: textColor),
                          hintText: "Enter Table Name"),
                      controller: tableNumberController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
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
                                  style: TextStyle(color: textColor),
                                ),
                              )
                            ],
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: textColor.withOpacity(.4), width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: TextFormField(
                        style: TextStyle(color: textColor),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            border: InputBorder.none,
                            hintText: "Number of people",
                            hintStyle: TextStyle(color: textColor)),
                        controller: peopleController,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: textColor.withOpacity(.4), width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: TextFormField(
                        style: TextStyle(color: textColor),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            border: InputBorder.none,
                            hintText: "Price",
                            hintStyle: TextStyle(color: textColor)),
                        controller: totalTablesPriceController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SaveButton(
                          title: "Add",
                          onTap: () {
                            if (tableNumberController.text.isEmpty) {
                              showSnakBar("Table Name is Required", context);
                            } else if (peopleController.text.isEmpty) {
                              showSnakBar("People Number is Required", context);
                            } else if (totalTablesPriceController
                                .text.isEmpty) {
                              showSnakBar("Table Price is Required", context);
                            } else if (tableNumberController.text.isEmpty ||
                                peopleController.text.isEmpty ||
                                totalTablesPriceController.text.isEmpty) {
                            } else {
                              tableList.add({
                                "tableNumber": tableNumberController.text,
                                "peopleNumber": peopleController.text,
                                "tableNo": _tableNo.toString(),
                                "tablePrice": totalTablesPriceController.text,
                              });

                              print(tableList);
                              tableNumberController.clear();
                              peopleController.clear();
                              totalTablesPriceController.clear();
                              setState(() {});

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Tables are Added")));
                            }
                          }))
                ],
              )
            ],
          ),
        ),
        tableList.isEmpty
            ? Container()
            : Container(
                width: MediaQuery.of(context).size.width,
                height: 114,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tableList.length,
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
                                tableList[index]['peopleNumber'],
                                style:
                                    TextStyle(color: textColor.withOpacity(.7)),
                              ),
                              Text(
                                tableList[index]['tableNo']
                                    .toString()
                                    .substring(8),
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                tableList[index]['tableNumber'],
                                style: TextStyle(color: Colors.white),
                              ),
                              Divider(),
                              Text(
                                "RS " + tableList[index]['tablePrice'],
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
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
                          onTap: () async {
                            if (eventNameController.text.isEmpty) {
                              showSnakBar("Name of event is Required", context);
                            } else if (fromDateController.text.isEmpty) {
                              showSnakBar("Event Start Date", context);
                            } else if (toDateController.text.isEmpty) {
                              showSnakBar("Event End Date", context);
                            } else if (eventLocationController.text.isEmpty) {
                              showSnakBar(
                                  "Event Location is Required", context);
                            } else if (eventNameController.text.isEmpty ||
                                fromDateController.text.isEmpty ||
                                toDateController.text.isEmpty ||
                                eventLocationController.text.isEmpty) {
                              showSnakBar("All Fields are required is Required",
                                  context);
                            } else {
                              setState(() {
                                _isLoading = true;
                              });
                              int i = 1;

                              for (var img in _image) {
                                setState(() {
                                  val > i / _image.length;
                                });
                                ref = firebase_storage.FirebaseStorage.instance
                                    .ref()
                                    .child('images/${uuid}');
                                await ref!.putFile(img).whenComplete(() async {
                                  String eventcPhoto = await StorageMethods()
                                      .uploadImageToStorage("eventCoverPhoto",
                                          eventCoverPhoto!, true);
                                  String eventTablePhoto =
                                      await StorageMethods()
                                          .uploadImageToStorage(
                                              "eventTable", eventTable!, true);

                                  await ref!.getDownloadURL().then((value) {
                                    FirebaseFirestore.instance
                                        .collection('events')
                                        .doc(uuid)
                                        .set({
                                      'selectedImages': value,
                                      "eventName": eventNameController.text,
                                      "eventType": eventTypeList,
                                      "eventTicketTimeBefore":
                                          timeBeforeController.text,
                                      "eventStartDate": selectDate.text ??
                                          DateTime.now().toIso8601String(),
                                      "fromEventDate": fromDateController
                                          .text, //Event Start Date
                                      "toEventDate": toDateController
                                          .text, // Event End Date
                                      "eventLocation":
                                          eventLocationController.text,
                                      "ticketdetail": itemList,
                                      "tabledetail": tableList,
                                      "uuid": uuid,
                                      "uid": FirebaseAuth
                                          .instance.currentUser!.uid,
                                      "eventDescription":
                                          eventdescriptionController.text,
                                      "eventAmenities": values,
                                      "timeDeadlineTicket":
                                          ticketPurchaseDeadlineController.text,
                                      "eventTicketPrice": priceController.text,
                                      "eventTicketSession": dropdownvalue,
                                      "conditions": termsController.text ?? "",
                                      "eventCreatedDate":
                                          FieldValue.serverTimestamp(),
                                      "offerName": offerNameController.text,
                                      "offerCode": offerCodeController.text,
                                      "dayNight": _fruit.toString(),
                                      "eventCoverPhoto": eventcPhoto,
                                      "participantType": couplesDropDown,
                                      "bird": birdController.text ?? "",
                                      "artistType": _artist.toString(),
                                      "eventTotalTickets":
                                          totalTicketsController.text,
                                      "eventTablePhoto": eventTablePhoto ?? "",
                                      //Tables
                                      "tablesName": tableNumberController.text,
                                      "tableType": _tableNo.toString(),
                                      "numofPeople": peopleController.text,
                                      "tablePrice":
                                          totalTablesPriceController.text
                                    });
                                    // imgRef!.add({'url': value});
                                    i++;
                                  });
                                });
                              }

                              setState(() {
                                _isLoading = false;
                              });
                              showSnakBar("Event is Created", context);
                              Navigator.pop(context);
                              peopleController.clear();
                              priceController.clear();
                              tableNumberController.clear();
                              totalTicketsController.clear();
                              birdController.clear();
                              offerCodeController.clear();
                              offerNameController.clear();
                              termsController.clear();
                              ticketPurchaseDeadlineController.clear();
                              eventdescriptionController.clear();
                              eventLocationController.clear();
                              toDateController.clear();
                              fromDateController.clear();
                              eventNameController.clear();
                              selectDate.clear();
                            }
                          }),
                    ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ]),
    );
  }

  //Functions
  selectEventImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      eventCoverPhoto = ui;
    });
  }

  selectEventTableImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      eventTable = ui;
    });
  }

  ListView buildStringList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: values.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            values[index],
            style: TextStyle(color: textColor),
          ),
        );
      },
    );
  }

  chooseImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile!.path));
    });
    if (pickedFile!.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file!.path));
      });
    } else {
      print(response.file);
    }
  }
}
