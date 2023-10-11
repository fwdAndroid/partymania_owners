import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker_plus/country_picker_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partymania_owners/screens/main_dashboard.dart';
import 'package:partymania_owners/screens/user_profie/widgets/image_club_profile_photo_update.dart';
import 'package:partymania_owners/screens/user_profie/widgets/image_cover_update.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/controllers.dart';
import 'package:partymania_owners/utils/droplist.dart';
import 'package:partymania_owners/utils/image.dart';
import 'package:partymania_owners/utils/textformfield.dart';
import 'package:partymania_owners/utils/utils.dart';

class EditClubProfileTextWidget extends StatefulWidget {
  const EditClubProfileTextWidget({super.key});

  @override
  State<EditClubProfileTextWidget> createState() =>
      _EditClubProfileTextWidgetState();
}

class _EditClubProfileTextWidgetState extends State<EditClubProfileTextWidget> {
  bool _isLoading = false;
  Uint8List? _coverEditPhoto;
  Uint8List? _ticketBluePrint;
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: FirebaseFirestore.instance
            .collection("clubs")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return new CircularProgressIndicator();
          }
          var document = snapshot.data;
          editclubNameController.text = document['clubName'];
          // club = document['clubType'];
          editclubphoneNumberClubController.text = document['clubPhoneNumber'];
          editclubLocationController.text = document['clubLocation'];

          editclubZipCodeController.text = document['clubZipCode'];
          editclubdescriptionController.text = document['clubDescription'];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _coverEditPhoto != null
                  ? InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => ImageCoverUpdate(
                                      image: document['coverPhoto'],
                                    )));
                      },
                      child: Image.memory(
                        _coverEditPhoto!,
                        width: 335,
                        height: 160,
                        fit: BoxFit.fill,
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => ImageCoverUpdate(
                                      image: document['coverPhoto'],
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          document['coverPhoto'],
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Images",
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _ticketBluePrint != null
                        ? InkWell(
                            onTap: selectTicketImage,
                            child: Image.memory(
                              _ticketBluePrint!,
                              height: 80,
                              width: 80,
                              fit: BoxFit.fill,
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => ImageTicketUpdate(
                                            image: document['ticketPhoto'],
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                document['ticketPhoto'],
                                height: 80,
                                width: 80,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                    SizedBox(
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
                      controller: editclubNameController,
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
                      hintText: "424-232-000",
                      controller: editclubphoneNumberClubController,
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
                      hintText: "Eden Garden",
                      controller: editclubLocationController,
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   width: 600,
              //   child: CountryPickerPlus(
              //     bottomSheetDecoration: bottomSheetDecoration,
              //     decoration: fieldDecoration,
              //     isRequired: true,
              //     countryLabel: "Country",
              //     countrySearchHintText: "Search Country",
              //     stateLabel: "State",
              //     stateHintText: "Tap to Select State",
              //     cityLabel: "City",
              //     countryHintText: "Tap to Select Country",
              //     cityHintText: "Tap to Select City",
              //     onCountrySaved: (value) {
              //       countryValue = value!;
              //       print(countryValue);
              //     },
              //     onCountrySelected: (value) {
              //       countryValue = value;
              //       print(countryValue);
              //     },
              //     onStateSelected: (value) {
              //       stateValue = value;
              //       print(stateValue);
              //     },
              //     onCitySelected: (value) {
              //       cityValue = value;
              //       print(cityValue);
              //     },
              //   ),
              // ),
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
                      controller: editclubZipCodeController,
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
              //       StreamBuilder(
              //         stream: FirebaseFirestore.instance
              //             .collection('clubs')
              //             .snapshots(),
              //         builder: (context, snapshot) {
              //           if (!snapshot.hasData) {
              //             return CircularProgressIndicator();
              //           }
              //           var stringList = [];
              //           snapshot.data!.docs.forEach((document) {
              //             // Assuming your document field is named 'stringValue'
              //             stringList.add(document['clubAmentities']);
              //           });

              //           return SizedBox(
              //             height: 40,
              //             child: ListView.builder(
              //               itemCount: stringList.length,
              //               itemBuilder: (context, index) {
              //                 return Text(
              //                   stringList[index].toString(),
              //                   style: TextStyle(color: textColor),
              //                 );
              //               },
              //             ),
              //           );
              //         },
              //       ),

              //       // TextFormInputField(
              //       //   suIcon: Padding(
              //       //       padding: const EdgeInsets.all(13.0),
              //       //       child: ElevatedButton(
              //       //           style: ElevatedButton.styleFrom(
              //       //               shape: RoundedRectangleBorder(
              //       //                   borderRadius:
              //       //                       BorderRadius.circular(10.0)),
              //       //               backgroundColor: otpColor),
              //       //           onPressed: () {},
              //       //           child: Text(
              //       //             "Add",
              //       //             style: TextStyle(color: textColor),
              //       //           ))),
              //       //   textInputType: TextInputType.text,
              //       //   hintText: "Add Amenities",
              //       //   controller: editamenitiesController,
              //       // )
              //     ],
              //   ),
              // ),
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
                        controller: editclubdescriptionController,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    _isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : SaveButton(title: "Save", onTap: updateClub),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  void updateClub() async {
    setState(() {
      _isLoading = true;
    });

    await FirebaseFirestore.instance
        .collection("clubs")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "clubName": editclubNameController.text,
      "clubPhoneNumber": editclubphoneNumberClubController.text,
      "clubType": club,
      "uid": FirebaseAuth.instance.currentUser!.uid,
      "clubLocation": editclubLocationController.text,
      "clubZipCode": editclubZipCodeController.text,
      "clubDescription": editclubdescriptionController.text,
    });
    setState(() {
      _isLoading = false;
    });

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (builder) => MainScreen(
                  user: FirebaseAuth.instance.currentUser,
                )));
    editclubLocationController.clear();
    editclubStateController.clear();
    editclubCityController.clear();
    editclubdescriptionController.clear();
    editclubLocationController.clear();
    editclubZipCodeController.clear();
    editclubNameController.clear();
    showSnakBar("Club Updated Successfully", context);
  }

  void selectImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _coverEditPhoto = ui;
    });
  }

  void selectTicketImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _ticketBluePrint = ui;
    });
  }
}
