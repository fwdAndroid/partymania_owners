import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/dashboard/widgets/home_list_view_widget.dart';
import 'package:partymania_owners/utils/colors.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: backgroundColor,
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: colorBlack,
      body: HomeListViewWidget(),
    );
  }
}
