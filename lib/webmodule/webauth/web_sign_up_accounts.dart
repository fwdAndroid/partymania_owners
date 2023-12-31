import 'package:flutter/material.dart';
import 'package:partymania_owners/services/auth_methods.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/controllers.dart';
import 'package:partymania_owners/utils/textformfield.dart';
import 'package:partymania_owners/utils/utils.dart';
import 'package:partymania_owners/webmodule/webauth/web_login_screen.dart';
import 'package:partymania_owners/webmodule/webclub/web_club_profile.dart';

class WebSignUpAccounts extends StatefulWidget {
  const WebSignUpAccounts({super.key});

  @override
  State<WebSignUpAccounts> createState() => _WebSignUpAccountsState();
}

class _WebSignUpAccountsState extends State<WebSignUpAccounts> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 24,
                          color: textColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "SignUp into your account",
                      style: TextStyle(
                          fontSize: 14,
                          color: textColor.withOpacity(.7),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Padding(
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
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Padding(
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
                ),
                Center(
                  child: Padding(
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
                          hintText: "Enter Number",
                          controller: phoneNumberController,
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create Password",
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
                              "assets/lock.png",
                              width: 10,
                              height: 10,
                            ),
                          ),
                          textInputType: TextInputType.text,
                          hintText: "Enter Password",
                          controller: createPassword,
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Confrim Password",
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
                              "assets/lock.png",
                              width: 10,
                              height: 10,
                            ),
                          ),
                          textInputType: TextInputType.text,
                          hintText: "Enter Password",
                          controller: confrimPassword,
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5, right: 12, left: 12),
                    child: Text(
                      "By tapping Sign up, you agree to our Terms and Policy",
                      style: TextStyle(
                          color: textColor.withOpacity(.7),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Center(child: SaveButton(title: "SignUp", onTap: onTap)),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            color: textColor.withOpacity(.7),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => WebLoginScreen()));
                        },
                        child: Text(
                          " Log In",
                          style: TextStyle(
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTap() async {
    setState(() {
      _isLoading = true;
    });
    String rse = await AuthMethods().signUpUser(
        email: signUpEmailController.text,
        phone_Number: phoneNumberController.text,
        confrimPassword: confrimPassword.text,
        createPassword: createPassword.text,
        fullName: signUpFullNameController.text);

    print(rse);
    setState(() {
      _isLoading = false;
    });
    if (rse != 'sucess') {
      showSnakBar(rse, context);
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => WebClubProfile()));
    }
  }
}
