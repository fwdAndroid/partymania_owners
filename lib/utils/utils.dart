import 'package:country_picker_plus/country_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:partymania_owners/utils/colors.dart';

/// SnakBar Code
showSnakBar(String contexts, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(contexts)));
}

var fieldDecoration = CPPFDecoration(
  suffixIcon: Icons.keyboard_arrow_down_rounded,
  suffixColor: textColor,
  textStyle: TextStyle(color: Colors.white),
  labelStyle: const TextStyle(
      fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white),
  hintStyle: const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
  margin: const EdgeInsets.all(10),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: borderColor.withOpacity(.4)),
    borderRadius: BorderRadius.circular(10),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: borderColor.withOpacity(.4)),
    borderRadius: BorderRadius.circular(10),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: borderColor.withOpacity(.4)),
    borderRadius: BorderRadius.circular(10),
  ),
);
final bottomSheetDecoration = CPPBSHDecoration(
  closeColor: Colors.deepOrangeAccent,
  itemDecoration: BoxDecoration(
    color: Colors.grey.withOpacity(0.03),
    borderRadius: BorderRadius.circular(8),
  ),
  itemsPadding: const EdgeInsets.all(8),
  itemsSpace: const EdgeInsets.symmetric(vertical: 4),
  itemTextStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ),
  shape: RoundedRectangleBorder(
    side: BorderSide(color: Colors.grey.withOpacity(0.1)),
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  ),
);
