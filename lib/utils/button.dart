import 'package:flutter/material.dart';
import 'package:partymania_owners/utils/colors.dart';

// ignore: must_be_immutable
class SaveButton extends StatelessWidget {
  String title;
  final void Function()? onTap;

  SaveButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xff823DD8),
            Color(0xff803DDA),
            Color(0xffF80354)
            //add more colors
          ]),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              fixedSize: Size(340, 49),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 14,
                fontFamily: "Mulish",
                fontWeight: FontWeight.w500,
                color: textColor),
          ),
        ));
  }
}

class OutlineButton extends StatelessWidget {
  String title;
  final void Function()? onTap;

  OutlineButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blueAccent,
              Colors.redAccent,
              Colors.purpleAccent
              //add more colors
            ]),
            borderRadius: BorderRadius.circular(5),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                  blurRadius: 5) //blur radius of shadow
            ]),
        child: OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: Color(0xffB0CAFF), width: 1),
              fixedSize: Size(340, 49),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          child: Text(
            title,
            style: TextStyle(
                fontFamily: "Mulish",
                fontWeight: FontWeight.w600,
                color: Color(0xffCFDEFC)),
          ),
        ));
  }
}
