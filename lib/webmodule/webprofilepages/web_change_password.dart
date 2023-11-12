import 'package:flutter/material.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/controllers.dart';
import 'package:partymania_owners/utils/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:partymania_owners/webmodule/webauth/web_login_screen.dart';

class WebChangePassword extends StatefulWidget {
  const WebChangePassword({super.key});

  @override
  State<WebChangePassword> createState() => _WebChangePasswordState();
}

class _WebChangePasswordState extends State<WebChangePassword> {
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
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Please enter your email address so that an link can be sent to change your password",
                          style: TextStyle(
                              color: Color(0xffF9FAFB),
                              fontWeight: FontWeight.w300,
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 500,
                          child: TextFormInputField(
                            textInputType: TextInputType.text,
                            hintText: "Enter Email Address",
                            controller: newConfrimPassword,
                          ),
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
                          onTap: () async {
                            await FirebaseAuth.instance
                                .sendPasswordResetEmail(
                                    email: newConfrimPassword.text)
                                .then((value) => {
                                      FirebaseAuth.instance.signOut(),
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) =>
                                                  WebLoginScreen()))
                                    });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text("Email verification link is sent")));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ]));
  }
}
