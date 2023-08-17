import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/details/create_new_event.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/controllers.dart';
import 'package:partymania_owners/utils/textformfield.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({super.key});

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: textColor),
          backgroundColor: backgroundColor,
          title: Text(
            "Create New Event",
            style: TextStyle(color: textColor),
          ),
        ),
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: TextFormInputField(
                    preIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.search),
                    ),
                    controller: searchController,
                    hintText: "Search User",
                    textInputType: TextInputType.emailAddress),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            CreateNewEvent()));
                              },
                              leading: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Image.asset("assets/profilepic.png"),
                              ),
                              title: Text(
                                "Kathryn Murphy",
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ));
                      }),
                ),
              )
            ],
          ),
        ));
  }
}
