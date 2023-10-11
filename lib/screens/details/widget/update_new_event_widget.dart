import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:partymania_owners/screens/details/widget/eventsimageupdate/update_event_cover.dart';
import 'package:partymania_owners/screens/details/widget/eventsimageupdate/update_event_photo.dart';
import 'package:partymania_owners/screens/main_dashboard.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/controllers.dart';
import 'package:partymania_owners/utils/droplist.dart';
import 'package:partymania_owners/utils/image.dart';
import 'package:partymania_owners/utils/textformfield.dart';

enum Fruit { day, night, both }

enum Artist { Guestlist, FullCover, NoCover }

enum TableNo { TableCharge, FullCover }

class UpdateNewEventWidget extends StatefulWidget {
  final uuid;
  final eventName;
  final toEventDate;
  final fromEventDate;
  final selectDate;
  final eventLocation;
  final eventPhoto;
  final eventCoverPhoto;
  final offerName;
  final offerCode;
  final eventDescription;
  // final eventAmenities;
  final numofpeople;
  const UpdateNewEventWidget(
      {super.key,
      required this.uuid,
      required this.fromEventDate,
      // required this.eventAmenities,
      required this.eventDescription,
      required this.toEventDate,
      required this.eventCoverPhoto,
      required this.eventPhoto,
      required this.numofpeople,
      required this.eventName,
      required this.eventLocation,
      required this.offerCode,
      required this.offerName,
      required this.selectDate});

  @override
  State<UpdateNewEventWidget> createState() => _UpdateNewEventWidgetState();
}

class _UpdateNewEventWidgetState extends State<UpdateNewEventWidget> {
  Uint8List? eventCoverPhoto;
  Uint8List? eventPhoto;
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool _isLoading = false;
  // List of items in our dropdown menu

  Fruit? _fruit = Fruit.day;
  Artist? _artist = Artist.Guestlist;

  var items = [
    'Before',
    'After',
  ];
  TableNo? _tableNo = TableNo.TableCharge;

  String dropdownvalue = 'Before';

  @override
  Widget build(BuildContext context) {
    eventUpdateNameController.text = widget.eventName;
    selectUpdateDate.text = widget.selectDate;
    fromUpdateDateController.text = widget.fromEventDate;
    toDateUpdateController.text = widget.toEventDate;
    eventLocationUpdateController.text = widget.eventLocation;
    eventdescriptionControllerUpdate.text = widget.eventDescription;
    // eventamenitiesControllerIUpdate.text = widget.eventAmenities;
    offerNameControllerUpdate.text = widget.offerName;
    offerCodeControllerUpdate.text = widget.offerCode;
    peopleControllerUpdate.text = widget.numofpeople;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => EventCoverUpdate(
                                    uuid: widget.uuid,
                                    image: widget.eventCoverPhoto.toString(),
                                  )));
                    },
                    child: Image.network(
                      widget.eventCoverPhoto.toString(),
                      height: 200,
                      width: MediaQuery.of(context).size.height,
                    )),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => EventPhotoUpdate(
                                uuid: widget.uuid,
                                image: widget.eventPhoto.toString(),
                              )));
                },
                child: Image.network(
                  widget.eventPhoto.toString(),
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
                controller: eventUpdateNameController,
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
                  _selectUpdateDate();
                },
                suIcon: Icon(
                  Icons.calendar_month,
                  color: textColor,
                ),
                textInputType: TextInputType.datetime,
                hintText: "Select Date",
                controller: selectUpdateDate,
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
                      controller: fromUpdateDateController,
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
                      controller: toDateUpdateController,
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
                controller: eventLocationUpdateController,
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
                  controller: eventdescriptionControllerUpdate,
                ),
              ),
            ],
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         "Amenities",
        //         style: TextStyle(
        //             color: textColor,
        //             fontWeight: FontWeight.w400,
        //             fontSize: 12),
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       TextFormInputField(
        //         suIcon: Padding(
        //             padding: const EdgeInsets.all(13.0),
        //             child: ElevatedButton(
        //                 style: ElevatedButton.styleFrom(
        //                     shape: RoundedRectangleBorder(
        //                         borderRadius: BorderRadius.circular(10.0)),
        //                     backgroundColor: otpColor),
        //                 onPressed: () {},
        //                 child: Text(
        //                   "Add",
        //                   style: TextStyle(color: textColor),
        //                 ))),
        //         textInputType: TextInputType.text,
        //         hintText: "Add Amenities",
        //         controller: eventamenitiesControllerIUpdate,
        //       )
        //     ],
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Align(
        //     alignment: AlignmentDirectional.centerStart,
        //     child: Text(
        //       "Tickets and Payments",
        //       style: TextStyle(
        //           color: textColor, fontWeight: FontWeight.w500, fontSize: 20),
        //     ),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Align(
        //     alignment: AlignmentDirectional.centerStart,
        //     child: InkWell(
        //       onTap: () => showAlertDialog(),
        //       child: Image.asset(
        //         "assets/add.png",
        //         width: 100,
        //         height: 100,
        //       ),
        //     ),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         "Ticket Purchase Deadline",
        //         style: TextStyle(
        //             color: textColor,
        //             fontWeight: FontWeight.w400,
        //             fontSize: 12),
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       TextFormInputField(
        //         onTap: _selectUpdateDate2,
        //         suIcon: Padding(
        //             padding: const EdgeInsets.all(13.0),
        //             child: Icon(
        //               Icons.calendar_month,
        //               color: textColor,
        //             )),
        //         textInputType: TextInputType.text,
        //         hintText: "Choose a Ticket Purchase Deadline",
        //         controller: ticketPurchaseDeadlineControllerUpdate,
        //       )
        //     ],
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Align(
        //     alignment: AlignmentDirectional.centerStart,
        //     child: Text(
        //       "Table and Blueprint",
        //       style: TextStyle(
        //           color: textColor, fontWeight: FontWeight.w500, fontSize: 20),
        //     ),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         "Upload Tables Blueprint",
        //         style: TextStyle(
        //             color: textColor,
        //             fontWeight: FontWeight.w400,
        //             fontSize: 12),
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       TextFormInputField(
        //         suIcon: Padding(
        //             padding: const EdgeInsets.all(13.0),
        //             child: ElevatedButton(
        //                 style: ElevatedButton.styleFrom(
        //                     shape: RoundedRectangleBorder(
        //                         borderRadius: BorderRadius.circular(10.0)),
        //                     backgroundColor: otpColor),
        //                 onPressed: () {},
        //                 child: Text(
        //                   "Upload",
        //                   style: TextStyle(color: textColor),
        //                 ))),
        //         textInputType: TextInputType.text,
        //         hintText: "12.jpg",
        //         controller: ticketPurchaseUploadControllerIUpdate,
        //       )
        //     ],
        //   ),
        // ),
        // SizedBox(
        //   height: 10,
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Align(
        //     alignment: AlignmentDirectional.centerStart,
        //     child: InkWell(
        //       onTap: showAlertDialog2,
        //       child: Image.asset(
        //         "assets/add.png",
        //         width: 100,
        //         height: 100,
        //       ),
        //     ),
        //   ),
        // ),
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
                controller: offerNameControllerUpdate,
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
                controller: offerCodeControllerUpdate,
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
                        title: "Update Event",
                        onTap: () async {
                          setState(() {
                            _isLoading = true;
                          });

                          await FirebaseFirestore.instance
                              .collection("events")
                              .doc(widget.uuid)
                              .update({
                            "eventName": eventUpdateNameController.text,
                            "eventType": eventTypeList,
                            "eventStartDate": selectUpdateDate.text,
                            "fromEventDate": fromUpdateDateController.text,
                            "toEventDate": toDateUpdateController.text,
                            "eventLocation": eventLocationUpdateController.text,
                            "eventDescription":
                                eventdescriptionControllerUpdate.text,
                            "eventAmenities":
                                eventamenitiesControllerIUpdate.text,
                            "participantType": couplesDropDown,
                            "bird": birdControllerUpdate.text,
                            "artistType": _artist.toString(),
                            "eventTicketSession": dropdownvalue,
                            "eventTicketTimeBefore":
                                timeBeforeControllerUpdate.text,
                            "eventTotalTickets":
                                totalTicketsControllerUpdate.text,
                            "eventTicketPrice": priceControllerUpdate.text,
                            "timeDeadlineTicket":
                                ticketPurchaseDeadlineControllerUpdate.text,
                            "ticketPurchase":
                                ticketPurchaseUploadControllerIUpdate.text,
                            "offerName": offerNameControllerUpdate.text,
                            "offerCode": offerCodeControllerUpdate.text,
                            "dayNight": _fruit.toString(),
                            "tableNumber": tableNumberControllerUpdate.text,
                            "tableType": _tableNo.toString(),
                            "numofPeople": peopleControllerUpdate.text,
                            "totaltables": totaltablesControllerUpdate.text,
                            "tablePrice": totalTablespriceControllerUpdate.text
                          }).then((value) {
                            eventUpdateNameController.clear();
                            selectUpdateDate.clear();
                            fromUpdateDateController.clear();
                            toDateUpdateController.clear();
                            eventLocationUpdateController.clear();

                            eventdescriptionControllerUpdate.clear();

                            birdControllerUpdate.clear();

                            timeBeforeControllerUpdate.clear();

                            totalTicketsControllerUpdate.clear();
                            priceControllerUpdate.clear();

                            ticketPurchaseDeadlineControllerUpdate.clear();

                            ticketPurchaseUploadControllerIUpdate.clear();
                            offerNameControllerUpdate.clear();
                            offerCodeControllerUpdate.clear();

                            tableNumberControllerUpdate.clear();

                            peopleControllerUpdate.clear();
                            totaltablesControllerUpdate.clear();
                            totalTablespriceControllerUpdate.clear();
                          });
                          setState(() {
                            _isLoading = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => MainScreen(
                                        user: FirebaseAuth.instance.currentUser,
                                      )));
                        },
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
  void _selectUpdateDate() async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    ).then((selectedDate) {
      if (selectedDate != null) {
        selectUpdateDate.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      }
    });
  }

  void _selectUpdateDate2() async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    ).then((selectedDate) {
      if (selectedDate != null) {
        ticketPurchaseDeadlineControllerUpdate.text =
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
        fromUpdateDateController.text = _selectedTime.format(context);
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
        toDateUpdateController.text = _selectedTime.format(context);
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

  //Ticket Alert
  showAlertDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              backgroundColor: Colors.white,
              insetPadding: EdgeInsets.all(8),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              title: Text(
                "Add Ticket",
                style: TextStyle(
                    color: colorBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 11, right: 11),
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black.withOpacity(.4), width: 1),
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
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
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
                          border: Border.all(
                              color: Color.fromARGB(255, 60, 89, 126),
                              width: 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.black),
                            hintText: "Early Bird"),
                        controller: birdControllerUpdate,
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
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(255, 60, 89, 126),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: DropdownButton(
                                  // Initial Value
                                  value: dropdownvalue,
                                  underline: SizedBox(),
                                  isDense: true,
                                  isExpanded: true,
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
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(255, 60, 89, 126),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextFormField(
                                onTap: () {
                                  _selectFromTicketTimeAlert();
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(12),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(13.0),
                                      child: Icon(
                                        Icons.timer,
                                        color: colorBlack,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.black),
                                    hintText: "9:30 AM"),
                                controller: timeBeforeControllerUpdate,
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
                                      color: Color.fromARGB(255, 60, 89, 126),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                    border: InputBorder.none,
                                    hintText: "Total Tickets",
                                    hintStyle: TextStyle(color: Colors.black)),
                                controller: totalTicketsControllerUpdate,
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
                                      color: Color.fromARGB(255, 60, 89, 126),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                    border: InputBorder.none,
                                    hintText: "Price",
                                    hintStyle: TextStyle(color: Colors.black)),
                                controller: priceControllerUpdate,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 10),
                      child: SaveButton(
                          title: "Add",
                          onTap: () {
                            Navigator.pop(
                              context,
                            );
                          }),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }

  void _selectFromTicketTimeAlert() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        timeBeforeControllerUpdate.text = _selectedTime.format(context);
      });
    }
  }

//Table
  void showAlertDialog2() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return AlertDialog(
                backgroundColor: Colors.white,
                insetPadding: EdgeInsets.all(8),
                contentPadding: EdgeInsets.all(8),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                title: Text(
                  'Add Table',
                  style: TextStyle(
                      color: colorBlack,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 60, 89, 126),
                                width: 1),
                            borderRadius: BorderRadius.circular(12)),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.black),
                              hintText: "Enter Table Number"),
                          controller: tableNumberControllerUpdate,
                        ),
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
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 60, 89, 126),
                                  width: 1),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                border: InputBorder.none,
                                hintText: "Number of people",
                                hintStyle: TextStyle(color: Colors.black)),
                            controller: peopleControllerUpdate,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromARGB(255, 60, 89, 126),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(12)),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(8),
                                      border: InputBorder.none,
                                      hintText: "Total Tables",
                                      hintStyle:
                                          TextStyle(color: Colors.black)),
                                  controller: totaltablesControllerUpdate,
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
                                        color: Color.fromARGB(255, 60, 89, 126),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(12)),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(8),
                                      border: InputBorder.none,
                                      hintText: "Price",
                                      hintStyle:
                                          TextStyle(color: Colors.black)),
                                  controller: totalTablespriceControllerUpdate,
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SaveButton(
                            title: "Add",
                            onTap: () {
                              Navigator.pop(context);
                            }),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
