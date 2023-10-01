import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/auth/otp/verify_phone.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:country_code_picker/country_code_picker.dart';

class GetOtp extends StatefulWidget {
  const GetOtp({super.key});

  @override
  State<GetOtp> createState() => _GetOtpState();
}

class _GetOtpState extends State<GetOtp> {
  TextEditingController _controller = TextEditingController();

  String dialCodeDigits = "+91";
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
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/logo.png",
                  width: 150,
                  height: 200,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Type the verification code we’ve sent you",
                style: TextStyle(
                    fontSize: 14,
                    color: textColor.withOpacity(.7),
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white70),
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Row(
                children: [
                  CountryCodePicker(
                      onChanged: (country) {
                        setState(() {
                          dialCodeDigits = country.dialCode!;
                        });
                      },
                      initialSelection: "IN",
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      favorite: const ["+91", "IN"]),
                  Expanded(
                    child: Container(
                      child: TextFormField(
                        validator: RequiredValidator(errorText: "Required"),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "12345678",
                          //  prefix: Padding(padding: EdgeInsets.all(10),child: Text(dialCodeDigits,style: TextStyle(color: Colors.black),),),
                        ),
                        keyboardType: TextInputType.number,
                        controller: _controller,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SaveButton(
                    title: "Continue",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => VerifyPhone(
                                  codeDigits: dialCodeDigits,
                                  phone: _controller.text)));
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
