import 'package:flutter/material.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/controllers.dart';
import 'package:partymania_owners/utils/textformfield.dart';

enum TableNo { TableCharge, FullCover }

class UploadTablesAlerts extends StatefulWidget {
  const UploadTablesAlerts({super.key});

  @override
  State<UploadTablesAlerts> createState() => _UploadTablesAlertsState();
}

class _UploadTablesAlertsState extends State<UploadTablesAlerts> {
  TableNo? _tableNo = TableNo.TableCharge;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                                hintText: "Number of people",
                                hintStyle: TextStyle(color: Colors.black)),
                            controller: peopleController,
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
                                hintText: "Type of Table",
                                hintStyle: TextStyle(color: Colors.black)),
                            controller: tableType,
                          ),
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
                                hintText: "Total Tickets",
                                hintStyle: TextStyle(color: Colors.black)),
                            controller: totalTicketsController,
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
  }
}
