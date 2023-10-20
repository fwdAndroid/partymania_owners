import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/controllers.dart';
import 'package:partymania_owners/utils/textformfield.dart';
import 'package:uuid/uuid.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  bool isLoading = false;
  var uuid = Uuid().v4();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: backgroundColor,
        title: Text(
          "Help & Support",
          style: TextStyle(color: textColor),
        ),
      ),
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "Email",
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
                  child: TextFormInputField(
                    textInputType: TextInputType.text,
                    hintText: "Email",
                    controller: emailController,
                  ),
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
                  "Subject",
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
                  hintText: "Enter Subject",
                  controller: subjectController,
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
                  "Description",
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: TextFormInputField(
                    maxLines: 5,
                    textInputType: TextInputType.text,
                    hintText: "Type Something",
                    controller: dse,
                  ),
                ),
                isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SaveButton(
                        title: "Submit",
                        onTap: () async {
                          if (emailController.text.isEmpty ||
                              subjectController.text.isEmpty ||
                              emailController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("All Fields are required")));
                          } else {
                            setState(() {
                              isLoading = true;
                            });
                            await FirebaseFirestore.instance
                                .collection("complains")
                                .doc(uuid)
                                .set({
                              "uid": FirebaseAuth.instance.currentUser!.uid,
                              "email": emailController.text,
                              "subject": subjectController.text,
                              "uuid": uuid,
                              "description": descriptionController.text
                            });
                            setState(() {
                              isLoading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Complain is Registered")));
                          }
                        })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
