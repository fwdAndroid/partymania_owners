import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/dashboard/widgets/scan_event_list_widgets.dart';
import 'package:partymania_owners/utils/colors.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Select Events",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [ScanEventListWidget()],
        ),
      ),
    );
  }
}
