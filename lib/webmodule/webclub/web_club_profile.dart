import 'package:flutter/material.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/webmodule/webclub/widget/create_club_profile_widget.dart';

class WebClubProfile extends StatefulWidget {
  const WebClubProfile({super.key});

  @override
  State<WebClubProfile> createState() => _WebClubProfileState();
}

class _WebClubProfileState extends State<WebClubProfile> {
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
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Create Your Club",
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
                    "Enter Details and create your club",
                    style: TextStyle(
                        fontSize: 14,
                        color: textColor.withOpacity(.7),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              CreateClubProfileWidget()
            ],
          ),
        ),
      ),
    );
  }
}
