import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/controllers.dart';
import 'package:partymania_owners/utils/textformfield.dart';

class EditUserProfile extends StatefulWidget {
  const EditUserProfile({super.key});

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isLoading = false;
  User? user;
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Edit Profile Details",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return new CircularProgressIndicator();
            }
            var docum = snapshot.data;

            editProfileFullNameController.text = docum['fullName'];
            // editProfileEmailController.text = docum['email'];
            editPhoneController.text = docum['phone_Number'];

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
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
                            controller: editProfileFullNameController,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         "Email",
                    //         style: TextStyle(
                    //             color: textColor,
                    //             fontWeight: FontWeight.w400,
                    //             fontSize: 12),
                    //       ),
                    //       SizedBox(
                    //         height: 10,
                    //       ),
                    //       TextFormInputField(
                    //         suIcon: TextButton(
                    //           child: Text(
                    //             "Verify",
                    //             style: TextStyle(color: Colors.green),
                    //           ),
                    //           onPressed: () async {
                    //             try {
                    //               await user!.updateEmail(
                    //                   editProfileEmailController.text);
                    //               // Send email verification
                    //               await user!.sendEmailVerification();
                    //               ScaffoldMessenger.of(context).showSnackBar(
                    //                 SnackBar(
                    //                   content: Text(
                    //                       'Email updated successfully. Verification email sent to $editProfileEmailController.text'),
                    //                 ),
                    //               );
                    //             } catch (error) {
                    //               ScaffoldMessenger.of(context).showSnackBar(
                    //                 SnackBar(
                    //                   content:
                    //                       Text('Error updating email: $error'),
                    //                 ),
                    //               );
                    //             }
                    //           },
                    //         ),
                    //         preIcon: Padding(
                    //           padding: const EdgeInsets.all(13.0),
                    //           child: Image.asset(
                    //             "assets/email.png",
                    //             width: 10,
                    //             height: 10,
                    //           ),
                    //         ),
                    //         textInputType: TextInputType.text,
                    //         hintText: "Email Address",
                    //         controller: editProfileEmailController,
                    //       )
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Phone Number",
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
                            controller: editPhoneController,
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
                                title: 'Save',
                                onTap: () async {
                                  await FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .update({
                                    "fullName":
                                        editProfileFullNameController.text,
                                    "phone_Number": editPhoneController.text
                                  }).then((value) => {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "User Profile Updated")))
                                          });
                                  editProfileFullNameController.clear();
                                  editProfileEmailController.clear();
                                  editPhoneController.clear();
                                  Navigator.pop(context);
                                })),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
