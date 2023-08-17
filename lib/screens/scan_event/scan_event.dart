import 'package:flutter/material.dart';
import 'package:partymania_owners/utils/colors.dart';

class ScanEvent extends StatefulWidget {
  const ScanEvent({super.key});

  @override
  State<ScanEvent> createState() => _ScanEventState();
}

class _ScanEventState extends State<ScanEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Scan Participant Ticket",
          style: TextStyle(
              color: textColor, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            "assets/scanback.png",
          ),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: const EdgeInsets.only(left: 40, right: 40),
            child: InkWell(
              onTap: () => alert(),
              child: Image.asset(
                "assets/scanner.png",
                width: 160,
                height: 80,
              ),
            ),
          ),
        ),
      ),
    );
  }

  alert() {}
}
