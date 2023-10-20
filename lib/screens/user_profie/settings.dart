import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/auth/login_screen.dart';
import 'package:partymania_owners/screens/user_profie/change_password.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/utils.dart';

class MySetting extends StatefulWidget {
  const MySetting({super.key});

  @override
  State<MySetting> createState() => _MySettingState();
}

class _MySettingState extends State<MySetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        centerTitle: true,
        title: Text(
          "MySetting",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        backgroundColor: backgroundColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          ListTile(
            // onTap: () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (builder) => EditUserProfile()));
            // },
            trailing: Icon(
              Icons.keyboard_arrow_right,
              size: 30,
              color: textColor,
            ),
            title: Text(
              "Privacy & Policy",
              style: TextStyle(
                  color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor.withOpacity(.7),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => ChangePassword()));
            },
            trailing: Icon(
              Icons.keyboard_arrow_right,
              size: 30,
              color: textColor,
            ),
            title: Text(
              "Change Password",
              style: TextStyle(
                  color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor.withOpacity(.7),
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: textColor,
                    title: new Text(
                      "Delete account",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    content: new Text(
                      "Are you sure you want to delete\nyour account?",
                      style: TextStyle(
                          color: Color(0xff7B7F91),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    actions: <Widget>[
                      Column(
                        children: [
                          SaveButton(
                            title: ("Delete"),
                            onTap: () async {
                              showSnakBar(
                                  "Account Deleted Successfully", context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => LoginScreen()));
                              FirebaseAuth.instance.currentUser!.delete();
                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .delete();
                            },
                          ),
                          TextButton(
                            child: Text(
                              "Not Now",
                              style: TextStyle(
                                  color: Color(0xff242424),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            title: Text(
              "Delete Account",
              style: TextStyle(
                  color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor.withOpacity(.7),
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: textColor,
                    title: new Text(
                      "Logout",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    content: new Text(
                      "Are you sure you want to Logout\nyour account?",
                      style: TextStyle(
                          color: Color(0xff7B7F91),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    actions: <Widget>[
                      Column(
                        children: [
                          SaveButton(
                            title: ("Logout"),
                            onTap: () async {
                              await FirebaseAuth.instance
                                  .signOut()
                                  .then((value) => {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    LoginScreen()))
                                      });
                            },
                          ),
                          TextButton(
                            child: Text(
                              "Not Now",
                              style: TextStyle(
                                  color: Color(0xff242424),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            title: Text(
              "Logout",
              style: TextStyle(
                  color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor.withOpacity(.7),
            ),
          ),
        ],
      ),
    );
  }
}
