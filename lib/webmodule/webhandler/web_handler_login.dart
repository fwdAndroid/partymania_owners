import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_owners/handlermodule/dashboard/handler_dashboard.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/controllers.dart';
import 'package:partymania_owners/utils/textformfield.dart';

class WebHandlerLogin extends StatefulWidget {
  const WebHandlerLogin({super.key});

  @override
  State<WebHandlerLogin> createState() => _WebHandlerLoginState();
}

class _WebHandlerLoginState extends State<WebHandlerLogin> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text(
                  //   "Enter Email",
                  //   style: TextStyle(
                  //       color: textColor,
                  //       fontWeight: FontWeight.w400,
                  //       fontSize: 12),
                  //   textAlign: TextAlign.start,
                  // ),
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
                      controller: loginEmailControllerH,
                      hintText: "Enter Email",
                      textInputType: TextInputType.emailAddress),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 12, right: 12, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text(
                  //   "Password",
                  //   style: TextStyle(
                  //       color: textColor,
                  //       fontWeight: FontWeight.w400,
                  //       fontSize: 12),
                  //   textAlign: TextAlign.center,
                  // ),
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
                      controller: createPassH,
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
    try {
      await FirebaseFirestore.instance
          .collection("handlers")
          .get()
          .then((QuerySnapshot snapshot) {
        print("sad");
        snapshot.docs.forEach((element) {
          if (element['createPassword'] == createPassH.text &&
              element['email'] == loginEmailControllerH.text &&
              element['type'] == "Handlers") {
            FirebaseAuth.instance
                .signInWithEmailAndPassword(
              email: loginEmailControllerH.text,
              password: createPassH.text,
            )
                .then((value) {
              checckstatus();
            });
          } else {
            // ScaffoldMessenger.of(context)
            //     .showSnackBar(SnackBar(content: Text("w")));
          }
        });
      });
    } catch (e) {}
  }

  void checckstatus() async {
    final DocumentReference userRef = FirebaseFirestore.instance
        .collection('handlers')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    final DocumentSnapshot userSnapshot = await userRef.get();
    Map<String, dynamic> data = userSnapshot.data() as Map<String, dynamic>;

    ;

    // User is blocked

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => HandlerDashboard(
                  ownerId: data['ownerUid'],
                )));
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Login Complete")));
  }
}
