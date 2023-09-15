import 'package:flutter/material.dart';
import 'package:partymania_owners/screens/main_dashboard.dart';
import 'package:partymania_owners/utils/button.dart';
import 'package:partymania_owners/utils/colors.dart';
import 'package:partymania_owners/utils/utils.dart';
import 'package:scanning_effect/scanning_effect.dart';

class ScanningPage extends StatefulWidget {
  const ScanningPage({super.key});

  @override
  State<ScanningPage> createState() => _ScanningPageState();
}

class _ScanningPageState extends State<ScanningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 500,
            child: ScanningEffect(
              scanningColor: Colors.red,
              borderLineColor: Colors.green,
              delay: Duration(seconds: 5),
              duration: Duration(seconds: 5),
              child: Container(
                child: SizedBox(),
              ),
            ),
          ),
          SaveButton(
              title: "Complete",
              onTap: () {
                showSnakBar("Scan Complete Successfully", context);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (builder) => MainScreen()));
              })
        ],
      ),
    );
  }
}
