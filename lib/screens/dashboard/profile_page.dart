import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/user_profie/edit_user_club_profile.dart';
import 'package:partymania_owners/screens/user_profie/edit_user_profile.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double? _ratingValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Profile",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/edit.png",
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Andrew Chadwick",
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            width: 230,
            decoration: BoxDecoration(
                color: Color(0xff4E4E4E),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: .5, color: textColor)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Toburg Club",
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
                RatingBar(
                    initialRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                        full: const Icon(Icons.star, color: Colors.yellow),
                        half: const Icon(
                          Icons.star_half,
                          color: Colors.yellow,
                        ),
                        empty: const Icon(
                          Icons.star_outline,
                          color: Colors.yellow,
                        )),
                    onRatingUpdate: (value) {
                      setState(() {
                        _ratingValue = value;
                      });
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor.withOpacity(.7),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => EditUserProfile()));
            },
            leading: Image.asset(
              "assets/frame.png",
              width: 30,
              height: 30,
            ),
            title: Text(
              "Edit Profile Details",
              style: TextStyle(
                  color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor.withOpacity(.7),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => EditUserClubProfile()));
            },
            leading: Image.asset(
              "assets/club.png",
              width: 30,
              height: 30,
            ),
            title: Text(
              "Edit Club Details",
              style: TextStyle(
                  color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor.withOpacity(.7),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 30,
              color: textColor,
            ),
            title: Text(
              "Settings",
              style: TextStyle(
                  color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor.withOpacity(.7),
            ),
          ),
          ListTile(
            leading: Image.asset(
              "assets/message-question.png",
              width: 30,
              height: 30,
            ),
            title: Text(
              "Help & Support",
              style: TextStyle(
                  color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor.withOpacity(.7),
            ),
          ),
        ],
      ),
    );
  }
}