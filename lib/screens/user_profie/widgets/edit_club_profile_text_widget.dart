import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
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
          club = document['clubType'];
          editclubphoneNumberClubController.text = document['clubPhoneNumber'];
          editclubLocationController.text = document['clubLocation'];
          editclubStateController.text = document['clubState'];
          editclubCityController.text = document['clubCity'];
          editclubZipCodeController.text = document['clubZipCode'];
          editclubdescriptionController.text = document['clubDescription'];
          editamenitiesController.text = document['clubAmentities'];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _coverEditPhoto != null
                  ? InkWell(
                      onTap: selectImage,
                      child: Image.memory(
                        _coverEditPhoto!,
                        width: 335,
                        height: 160,
                        fit: BoxFit.fill,
                      ),
                    )
                  : InkWell(
                      onTap: selectImage,
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
                            onTap: selectTicketImage,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "State",
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          TextFormInputField(
                            suIcon: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Image.asset(
                                "assets/Vector.png",
                                width: 10,
                                height: 10,
                              ),
                            ),
                            textInputType: TextInputType.text,
                            hintText: "Select State",
                            controller: editclubStateController,
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
                            "City",
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          TextFormInputField(
                            suIcon: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Image.asset(
                                "assets/Vector.png",
                                width: 10,
                                height: 10,
                              ),
                            ),
                            textInputType: TextInputType.text,
                            hintText: "Select City",
                            controller: editclubCityController,
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
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  backgroundColor: otpColor),
                              onPressed: () {},
                              child: Text(
                                "Add",
                                style: TextStyle(color: textColor),
                              ))),
                      textInputType: TextInputType.text,
                      hintText: "Add Amenities",
                      controller: editamenitiesController,
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
    String rse = await FirebaseMethods().updateClub(
        _coverEditPhoto!,
        _ticketBluePrint!,
        editclubdescriptionController.text,
        FirebaseAuth.instance.currentUser!.uid,
        editclubLocationController.text,
        editclubphoneNumberClubController.text,
        editclubNameController.text,
        club,
        editclubStateController.text,
        editclubCityController.text,
        editclubZipCodeController.text,
        editamenitiesController.text);

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
