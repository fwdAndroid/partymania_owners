import 'package:flutter/material.dart';
import 'package:partymania_owners/utils/colors.dart';

class HandlerProfilePage extends StatefulWidget {
  const HandlerProfilePage({super.key});

  @override
  State<HandlerProfilePage> createState() => _HandlerProfilePageState();
}

class _HandlerProfilePageState extends State<HandlerProfilePage> {
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor.withOpacity(.7),
            ),
          ),
          ListTile(
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (builder) => Settings()));
            },
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
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (builder) => Help()));
            },
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
