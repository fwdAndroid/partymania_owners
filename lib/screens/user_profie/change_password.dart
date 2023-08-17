import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/auth/login_screen.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/controllers.dart';
import 'package:partymania_owners/utils/textformfield.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        centerTitle: true,
        title: Text(
          "Change Password",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Current Password",
                  style: TextStyle(
                      color: Color(0xffF9FAFB),
                      fontWeight: FontWeight.w300,
                      fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormInputField(
                  textInputType: TextInputType.text,
                  hintText: "Current Password",
                  controller: currentPass,
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
                  "New Passowrd",
                  style: TextStyle(
                      color: Color(0xffF9FAFB),
                      fontWeight: FontWeight.w300,
                      fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormInputField(
                  textInputType: TextInputType.text,
                  hintText: "New Password",
                  controller: newPassword,
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
                  "Confirm New Password",
                  style: TextStyle(
                      color: Color(0xffF9FAFB),
                      fontWeight: FontWeight.w300,
                      fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormInputField(
                  textInputType: TextInputType.text,
                  hintText: "Confirm New Password",
                  controller: newConfrimPassword,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: SaveButton(
                      title: "Change Password",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => LoginScreen()));
                      })),
            ),
          ),
        ],
      ),
    );
  }
}
