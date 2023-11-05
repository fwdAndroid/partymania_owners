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

class WebEditWebUserClubProfile extends StatefulWidget {
  var clubAmentities;
  final clubCity;
  final clubCountry;
  final clubDescription;
  final clubLocation;
  final clubName;
  final clubPhoneNumber;
  final clubState;
  final clubType;
  final clubZipCode;
  final coverPhoto;
  final ticketPhoto;

  WebEditWebUserClubProfile({
    super.key,
    required this.clubAmentities,
    required this.clubCity,
    required this.clubCountry,
    required this.clubDescription,
    required this.clubLocation,
    required this.clubName,
    required this.clubPhoneNumber,
    required this.clubState,
    required this.clubType,
    required this.clubZipCode,
    required this.coverPhoto,
    required this.ticketPhoto,
  });

  @override
  State<WebEditWebUserClubProfile> createState() =>
      _WebEditWebUserClubProfileState();
}

class _WebEditWebUserClubProfileState extends State<WebEditWebUserClubProfile> {
  bool _isLoading = false;
  Uint8List? _coverEditPhoto;
  Uint8List? _ticketBluePrint;
  // String countryValue = "";
  // String stateValue = '';
  // String cityValue = "";
  @override
  Widget build(BuildContext context) {
    editclubNameController.text = widget.clubName;
    // club = document['clubType'];
    editclubphoneNumberClubController.text = widget.clubPhoneNumber;
    editclubLocationController.text = widget.clubLocation;

    editclubZipCodeController.text = widget.clubZipCode;
    editclubdescriptionController.text = widget.clubDescription;
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      _coverEditPhoto != null
          ? InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => ImageCoverUpdate(
                              image: widget.coverPhoto,
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
                              image: widget.coverPhoto,
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  widget.coverPhoto,
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
                  color: textColor, fontWeight: FontWeight.w400, fontSize: 12),
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
                                    image: widget.ticketPhoto,
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        widget.ticketPhoto,
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
                  color: textColor, fontWeight: FontWeight.w400, fontSize: 12),
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
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 500, right: 500),
                child: Text(
                  "Type",
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 500, right: 500),
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
              ),
            ],
          ),
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
                  color: textColor, fontWeight: FontWeight.w400, fontSize: 12),
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
                  color: textColor, fontWeight: FontWeight.w400, fontSize: 12),
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
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Zip Code",
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.w400, fontSize: 12),
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
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.clubAmentities.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 60,
                              height: 20,
                              decoration: BoxDecoration(
                                color: const Color(0xff4E4E4E),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: const Color(0xff4E4E4E),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  widget.clubAmentities[index].toString(),
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(.7)),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormInputField(
                      suIcon: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  backgroundColor: otpColor),
                              onPressed: () {
                                String text = editamenitiesController.text;
                                if (text.isNotEmpty) {
                                  addToStringList(text);
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Values are Added")));
                              },
                              child: Text(
                                "Add",
                                style: TextStyle(color: textColor),
                              ))),
                      textInputType: TextInputType.text,
                      hintText: "Add Amenities",
                      controller: editamenitiesController,
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
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
                        width: 380,
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
                          : Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child:
                                  SaveButton(title: "Save", onTap: updateClub)),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ))
    ]);
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

  void addToStringList(String text) {
    setState(() {
      widget.clubAmentities.add(text);
      editamenitiesController.clear();
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
      "clubAmentities": widget.clubAmentities,
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
}
