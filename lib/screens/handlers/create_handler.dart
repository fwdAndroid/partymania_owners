import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/handlers/manage_handlers.dart';
import 'package:partymania_owners/services/auth_methods.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/controllers.dart';
import 'package:partymania_owners/utils/textformfield.dart';

class CreateHandler extends StatefulWidget {
  final owernerid;
  const CreateHandler({super.key, required this.owernerid});

  @override
  State<CreateHandler> createState() => _CreateHandlerState();
}

class _CreateHandlerState extends State<CreateHandler> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "Create Handlers",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      controller: handlerFullName,
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
                      controller: handlerEmail,
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
                      controller: handlerPhone,
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
                      controller: handlerP,
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
                      controller: handlerCP,
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
                      child: SaveButton(title: 'Add Handler', onTap: onCreate),
                    ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCreate() async {
    //Area

    if (handlerP.text.isEmpty &&
        handlerEmail.text.isEmpty &&
        handlerFullName.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("All Fields are required")));
    } else if (handlerEmail.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("email address is required")));
    } else if (handlerFullName.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("name of the user is required")));
    } else if (handlerP.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("password is required")));
    } else {
      setState(() {
        _isLoading = true;
      });

      // FirebaseAuth.instance.createUserWithEmailAndPassword(
      //     email: handlerEmail.text, password: handlerP.text);

      String rse = await AuthMethods().handlerSignUp(
          ownerUid: widget.owernerid,
          email: handlerEmail.text,
          fullName: handlerFullName.text,
          phone_Number: handlerPhone.text,
          createPassword: handlerP.text,
          confrimPassword: handlerCP.text);

      print(rse);
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Conguration Handler is Created")));
      handlerEmail.clear();
      handlerFullName.clear();
      handlerPhone.clear();
      handlerP.clear();
      handlerCP.clear();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (builder) => ManageHandlers(
                    clubid: widget.owernerid,
                  )));
    }
  }
}
