import 'package:flutter/material.dart';
import 'package:partymania_owners/handlermodule/pages/widget/scan_list_widget_hander.dart';
import 'package:partymania_owners/utils/colors.dart';

class HandlerScanPage extends StatefulWidget {
  final ownerId;
  const HandlerScanPage({
    super.key,
    required this.ownerId,
  });

  @override
  State<HandlerScanPage> createState() => _HandlerScanPageState();
}

class _HandlerScanPageState extends State<HandlerScanPage> {
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
          children: [
            ScanEventListWidgetHandler(
              ownerId: widget.ownerId,
            )
          ],
        ),
      ),
    );
  }
}
