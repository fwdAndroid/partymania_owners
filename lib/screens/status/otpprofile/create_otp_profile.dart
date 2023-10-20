import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/status/otpprofile/widget/create_otp_profile_widget.dart';
import 'package:partymania_owners/utils/colors.dart';

class CreateOTPProfile extends StatefulWidget {
  const CreateOTPProfile({super.key});

  @override
  State<CreateOTPProfile> createState() => _CreateOTPProfileState();
}

class _CreateOTPProfileState extends State<CreateOTPProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
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
                  "Create Your Club",
                  style: TextStyle(
                      fontSize: 24,
                      color: textColor,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Enter Details and create your club",
                  style: TextStyle(
                      fontSize: 14,
                      color: textColor.withOpacity(.7),
                      fontWeight: FontWeight.w400),
                ),
              ),
              CreateOTPProfileWidget()
            ],
          ),
        ),
      ),
    );
  }
}
