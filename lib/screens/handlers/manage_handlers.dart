import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/handlers/create_handler.dart';
import 'package:partymania_owners/utils/colors.dart';

class ManageHandlers extends StatefulWidget {
  const ManageHandlers({super.key});

  @override
  State<ManageHandlers> createState() => _ManageHandlersState();
}

class _ManageHandlersState extends State<ManageHandlers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "Manage Handlers",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: SizedBox(
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
                              builder: (builder) => CreateHandler()));
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
    );
  }
}
