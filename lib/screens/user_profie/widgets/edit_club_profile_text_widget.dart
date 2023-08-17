import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/main_dashboard.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/controllers.dart';
import 'package:partymania_owners/utils/textformfield.dart';

class EditClubProfileTextWidget extends StatefulWidget {
  const EditClubProfileTextWidget({super.key});

  @override
  State<EditClubProfileTextWidget> createState() =>
      _EditClubProfileTextWidgetState();
}

class _EditClubProfileTextWidgetState extends State<EditClubProfileTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/add.png",
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        "assets/add.png",
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        "assets/add.png",
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        "assets/add.png",
                        width: 80,
                        height: 80,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/add.png",
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        "assets/add.png",
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        "assets/add.png",
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        "assets/add.png",
                        width: 80,
                        height: 80,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
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
                hintText: "img.jpg",
                controller: editclubimageController,
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
              TextFormInputField(
                suIcon: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Image.asset(
                      "assets/Vector.png",
                      height: 10,
                      width: 10,
                    )),
                textInputType: TextInputType.text,
                hintText: "Select Type",
                controller: editclubTypeController,
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
                                borderRadius: BorderRadius.circular(10.0)),
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
              SaveButton(
                  title: "Save",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => MainScreen()));
                  }),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
