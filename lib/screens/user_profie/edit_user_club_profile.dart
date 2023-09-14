import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/user_profie/widgets/edit_club_profile_text_widget.dart';
import 'package:partymania_owners/utils/colors.dart';

class EditUserClubProfile extends StatefulWidget {
  const EditUserClubProfile({super.key});

  @override
  State<EditUserClubProfile> createState() => _EditUserClubProfileState();
}

class _EditUserClubProfileState extends State<EditUserClubProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Edit Club Details",
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
              const SizedBox(
                height: 20,
              ),
              EditClubProfileTextWidget()
            ],
          ),
        ),
      ),
    );
  }
}
