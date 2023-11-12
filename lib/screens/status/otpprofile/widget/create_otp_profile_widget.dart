import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/profile/create_profile.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/controllers.dart';
import 'package:partymania_owners/utils/textformfield.dart';
import 'package:partymania_owners/utils/utils.dart';

class CreateOTPProfileWidget extends StatefulWidget {
  const CreateOTPProfileWidget({super.key});

  @override
  State<CreateOTPProfileWidget> createState() => _CreateOTPProfileWidgetState();
}

class _CreateOTPProfileWidgetState extends State<CreateOTPProfileWidget> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Create User Profile",
            style: TextStyle(
                fontSize: 24, color: textColor, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Full Name",
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
                    "assets/frame.png",
                    width: 10,
                    height: 10,
                  ),
                ),
                textInputType: TextInputType.text,
                hintText: "Enter Full Name",
                controller: signUpFullNameController,
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email",
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
                    "assets/email.png",
                    width: 10,
                    height: 10,
                  ),
                ),
                textInputType: TextInputType.text,
                hintText: "Email Address",
                controller: signUpEmailController,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: SaveButton(
                    title: "SignUp",
                    onTap: () async {
                      if (signUpFullNameController.text.isEmpty ||
                          signUpEmailController.text.isEmpty) {
                        showSnakBar("All Fields are required", context);
                      } else {
                        setState(() {
                          _isLoading = true;
                        });
                        await FirebaseFirestore.instance
                            .collection("users")
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .set({
                          "email": signUpEmailController.text,
                          "phone_Number": FirebaseAuth
                              .instance.currentUser!.phoneNumber!
                              .toString(),
                          "uid": FirebaseAuth.instance.currentUser!.uid,
                          "fullName": signUpFullNameController.text,
                          "clubRequest": false
                        });
                        setState(() {
                          _isLoading = false;
                        });
                        showSnakBar("Profile Created", context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => CreateProfile()));
                      }
                    })),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
