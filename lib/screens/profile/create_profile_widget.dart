import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker_plus/country_picker_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partymania_owners/screens/main_dashboard.dart';
import 'package:partymania_owners/services/database_methods.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/controllers.dart';
import 'package:partymania_owners/utils/droplist.dart';
import 'package:partymania_owners/utils/image.dart';
import 'package:partymania_owners/utils/textformfield.dart';
import 'package:partymania_owners/utils/utils.dart';

class CreateProfileWidget extends StatefulWidget {
  const CreateProfileWidget({super.key});

  @override
  State<CreateProfileWidget> createState() => _CreateProfileWidgetState();
}

class _CreateProfileWidgetState extends State<CreateProfileWidget> {
  Uint8List? _coverPhoto;
  Uint8List? _ticketBluePrint;
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  List<String> values = [];

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _coverPhoto != null
              ? InkWell(
                  onTap: selectImage,
                  child: Image.memory(
                    _coverPhoto!,
                    width: 335,
                    height: 160,
                    fit: BoxFit.fitHeight,
                  ),
                )
              : InkWell(
                  onTap: selectImage, child: Image.asset("assets/img.png")),
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
              _ticketBluePrint != null
                  ? Center(
                      child: InkWell(
                        onTap: selectTicket,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.memory(
                              _ticketBluePrint!,
                              width: 167,
                              height: 90,
                              fit: BoxFit.cover,
                            )),
                      ),
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
                              onPressed: selectTicket,
                              child: Text(
                                "Upload",
                                style: TextStyle(color: textColor),
                              ))),
                      textInputType: TextInputType.text,
                      hintText: "img.jpg",
                      controller: imageController,
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
                "Club Name",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormInputField(
                preIcon: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Image.asset(
                      "assets/club.png",
                      height: 10,
                      width: 10,
                    )),
                textInputType: TextInputType.text,
                hintText: "Enter Your Club Name",
                controller: clubNameController,
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
                "Type",
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
                      value: club,
                      underline: SizedBox(),
                      isDense: true,
                      dropdownColor: Colors.black,
                      isExpanded: true,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: clubType.map((String clubType) {
                        return DropdownMenuItem(
                          value: clubType,
                          child: Text(
                            clubType,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: textColor),
                          ),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          club = newValue!;
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
                "Club Phone Number",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormInputField(
                preIcon: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Image.asset(
                    "assets/call.png",
                    width: 10,
                    height: 10,
                  ),
                ),
                textInputType: TextInputType.number,
                hintText: "Club Phone Number",
                controller: phoneNumberClubController,
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
                preIcon: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Image.asset(
                    "assets/routing.png",
                    width: 10,
                    height: 10,
                  ),
                ),
                textInputType: TextInputType.text,
                hintText: "Enter Address",
                controller: clubLocationController,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 600,
          child: CountryPickerPlus(
            bottomSheetDecoration: bottomSheetDecoration,
            decoration: fieldDecoration,
            isRequired: true,
            countryLabel: "Country",
            countrySearchHintText: "Search Country",
            stateLabel: "State",
            stateHintText: "Tap to Select State",
            cityLabel: "City",
            countryHintText: "Tap to Select Country",
            cityHintText: "Tap to Select City",
            onCountrySaved: (value) {
              countryValue = value!;
              print(countryValue);
            },
            onCountrySelected: (value) {
              countryValue = value;
              print(countryValue);
            },
            onStateSelected: (value) {
              stateValue = value;
              print(stateValue);
            },
            onCitySelected: (value) {
              cityValue = value;
              print(cityValue);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Zip Code",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
              const SizedBox(
                height: 7,
              ),
              TextFormInputField(
                textInputType: TextInputType.text,
                hintText: "Enter Zip Code",
                controller: clubZipCodeController,
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
                        onPressed: () {
                          values.add(amenitiesController.text);
                          amenitiesController.clear();
                          addToAmenties(values);
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(color: textColor),
                        ))),
                textInputType: TextInputType.text,
                hintText: "Add Amenities",
                controller: amenitiesController,
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
                "Description",
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
                  controller: descriptionController,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SaveButton(title: "Create Club", onTap: createClub)
            ],
          ),
        ),
      ],
    );
  }

  //Functions
  selectImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _coverPhoto = ui;
    });
  }

  void selectTicket() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _ticketBluePrint = ui;
    });
  }

  createClub() async {
    setState(() {
      _isLoading = true;
    });
    String rse = await FirebaseMethods().createClub(
        _coverPhoto!,
        _ticketBluePrint!,
        descriptionController.text,
        FirebaseAuth.instance.currentUser!.uid,
        clubLocationController.text,
        phoneNumberClubController.text,
        clubNameController.text,
        club,
        stateValue,
        cityValue,
        countryValue,
        clubZipCodeController.text,
        values);

    print(rse);
    setState(() {
      _isLoading = false;
    });
    if (rse != 'sucess') {
      showSnakBar(rse, context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => MainScreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => MainScreen()));
    }
  }

  addToAmenties(List<String> values) {
    var items = FirebaseFirestore.instance
        .collection('clubs')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    items.set({"clubAmentities": values});
    return values;
  }
}
