import 'package:flutter/material.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/controllers.dart';
import 'package:partymania_owners/utils/textformfield.dart';

enum Couples { Couple, Male, Female }

enum Artist { Guestlist, FullCover, NoCover }

class TicketsAndPaymentsAlerts extends StatefulWidget {
  const TicketsAndPaymentsAlerts({super.key});

  @override
  State<TicketsAndPaymentsAlerts> createState() =>
      _TicketsAndPaymentsAlertsState();
}

class _TicketsAndPaymentsAlertsState extends State<TicketsAndPaymentsAlerts> {
  Couples? _couples = Couples.Couple;
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
