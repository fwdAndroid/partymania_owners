import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/webmodule/webhandlers/web_create_handler.dart';

class WebManageHandlers extends StatefulWidget {
  final clubid;
  const WebManageHandlers({super.key, required this.clubid});

  @override
  State<WebManageHandlers> createState() => _WebManageHandlersState();
}

class _WebManageHandlersState extends State<WebManageHandlers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: otpColor,
        onPressed: () {
          print(widget.clubid);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) => WebCreateHandler(
                        owernerid: widget.clubid,
                      )));
        },
        child: Icon(
          Icons.add,
          color: textColor,
        ),
      ),
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
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("handlers")
                .where("ownerUid", isEqualTo: widget.clubid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text(
                    "No Handler added yet",
                    style: TextStyle(color: otpColor),
                  ),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return StreamBuilder<Object>(
                        stream: FirebaseFirestore.instance
                            .collection("handlers")
                            .where("ownerUid", isEqualTo: widget.clubid)
                            .snapshots(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final List<DocumentSnapshot> documents =
                              snapshot.data!.docs;
                          final Map<String, dynamic> data =
                              documents[index].data() as Map<String, dynamic>;
                          return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ListTile(
                                onTap: () {},
                                title: Text(
                                  data['fullName'],
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data['email'],
                                      style: TextStyle(
                                          color: textColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      data['createPassword'],
                                      style: TextStyle(
                                          color: textColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ));
                        });
                  });
            }),
      ),
    );
  }
}
