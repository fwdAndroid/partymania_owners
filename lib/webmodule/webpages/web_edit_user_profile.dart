import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/user_profie/widgets/edit_club_profile_text_widget.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/webmodule/webpages/widget/web_edit_user_profile_text_widget.dart';

class EditWebUserClubProfile extends StatefulWidget {
  var clubAmentities;
  final clubCity;
  final clubCountry;
  final clubDescription;
  final clubLocation;
  final clubName;
  final clubPhoneNumber;
  final clubState;
  final clubType;
  final clubZipCode;
  final coverPhoto;
  final ticketPhoto;
  EditWebUserClubProfile({
    super.key,
    required this.clubAmentities,
    required this.clubCity,
    required this.clubCountry,
    required this.clubDescription,
    required this.clubLocation,
    required this.clubName,
    required this.clubPhoneNumber,
    required this.clubState,
    required this.clubType,
    required this.clubZipCode,
    required this.coverPhoto,
    required this.ticketPhoto,
  });

  @override
  State<EditWebUserClubProfile> createState() => _EditWebUserClubProfileState();
}

class _EditWebUserClubProfileState extends State<EditWebUserClubProfile> {
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
              WebEditWebUserClubProfile(
                clubAmentities: widget.clubAmentities,
                clubCity: widget.clubCity,
                clubCountry: widget.clubCountry,
                clubDescription: widget.clubDescription,
                clubLocation: widget.clubLocation,
                clubName: widget.clubName,
                clubPhoneNumber: widget.clubPhoneNumber,
                clubState: widget.clubState,
                clubType: widget.clubType,
                clubZipCode: widget.clubZipCode,
                coverPhoto: widget.coverPhoto,
                ticketPhoto: widget.ticketPhoto,
              )
            ],
          ),
        ),
      ),
    );
  }
}
