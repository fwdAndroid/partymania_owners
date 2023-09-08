import 'package:flutter/material.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/controllers.dart';

enum Couples { Couple, Male, Female }

enum Artist { Guestlist, FullCover, NoCover }

class TicketsAndPaymentsAlerts extends StatefulWidget {
  const TicketsAndPaymentsAlerts({super.key});

  @override
  State<TicketsAndPaymentsAlerts> createState() =>
      _TicketsAndPaymentsAlertsState();
}

class _TicketsAndPaymentsAlertsState extends State<TicketsAndPaymentsAlerts> {
  var itemsCouples = ['Male', 'Female', 'Couple'];
  String couplesDropDown = "Male";
  Artist? _artist = Artist.Guestlist;

  var items = [
    'Before',
    'After',
  ];
  String dropdownvalue = 'Before';

  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }

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
                      margin: EdgeInsets.only(left: 10, right: 10),
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
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: itemsCouples.map((String couplesDropDown) {
                              return DropdownMenuItem(
                                value: couplesDropDown,
                                child: Text(
                                  couplesDropDown,
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
                            hintText: "9:30 AM"),
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
                                  _selectFromTimeAlert();
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
                                      color: Color.fromARGB(255, 60, 89, 126),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                    border: InputBorder.none,
                                    hintText: "Total Tickets",
                                    hintStyle: TextStyle(color: Colors.black)),
                                controller: totalTicketsController,
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
                                controller: priceController,
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
                            Navigator.pop(context);
                          }),
                    )
                  ],
                ),
              ),
            );
          });
        });
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
}


//                     ],
//                   ),

