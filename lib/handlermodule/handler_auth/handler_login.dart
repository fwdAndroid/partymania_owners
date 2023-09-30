import 'package:flutter/material.dart';
import 'package:partymania_owners/handlermodule/dashboard/handler_dashboard.dart';
import 'package:partymania_owners/screens/auth/getotp.dart';
import 'package:partymania_owners/screens/auth/signup_account.dart';
import 'package:partymania_owners/screens/status/checkstatus.dart';
import 'package:partymania_owners/services/auth_methods.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/controllers.dart';
import 'package:partymania_owners/utils/textformfield.dart';
import 'package:partymania_owners/utils/utils.dart';

class HandlerLogin extends StatefulWidget {
  const HandlerLogin({super.key});

  @override
  State<HandlerLogin> createState() => _HandlerLoginState();
}

class _HandlerLoginState extends State<HandlerLogin> {
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: 24,
                    color: textColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Login into your account",
                style: TextStyle(
                    fontSize: 14,
                    color: textColor.withOpacity(.7),
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 12, right: 12, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter Email or Phone",
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormInputField(
                      preIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          "assets/sms.png",
                          width: 15,
                          height: 15,
                        ),
                      ),
                      controller: loginEmailController,
                      hintText: "Enter Email",
                      textInputType: TextInputType.emailAddress),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 12, right: 12, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormInputField(
                      preIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          "assets/lock.png",
                          width: 15,
                          height: 15,
                        ),
                      ),
                      controller: passwordController,
                      hintText: "Enter Password",
                      textInputType: TextInputType.emailAddress),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: SaveButton(
                      title: 'Login',
                      onTap: loginUser,
                    ),
                  ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String rse = await AuthMethods().loginUpUser(
      email: loginEmailController.text,
      pass: passwordController.text,
    );

    print(rse);
    setState(() {
      _isLoading = false;
    });
    if (rse == 'sucess') {
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => HandlerDashboard()));
      loginEmailController.clear();
      passwordController.clear();
    } else {
      showSnakBar(rse, context);
    }
  }
}
