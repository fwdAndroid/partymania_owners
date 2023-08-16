import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:partymania_owners/utils/colors.dart';

class TextFormInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final Widget? preIcon;
  final Widget? suIcon;

  final void Function()? onTap;
  final void Function(String)? onChanged;

  final AutovalidateMode? autovalidateMode;
  final FormFieldValidator? validat;
  final List<TextInputFormatter>? inputFormatters;
  final String? error;
  final int? maxLines;

  const TextFormInputField(
      {Key? key,
      required this.controller,
      this.isPass = false,
      this.preIcon,
      this.suIcon,
      this.onChanged,
      this.error,
      this.maxLines,
      this.onTap,
      this.autovalidateMode,
      this.inputFormatters,
      this.validat,
      required this.hintText,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 60,
      child: TextFormField(
        maxLines: maxLines,
        style: TextStyle(color: textColor),
        onTap: onTap,
        autovalidateMode: autovalidateMode,
        inputFormatters: inputFormatters,
        validator: validat,
        onChanged: onChanged,
        keyboardType: textInputType,
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: suIcon,
            prefixIcon: preIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor.withOpacity(.4)),
              borderRadius: BorderRadius.circular(10),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor.withOpacity(.4)),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor.withOpacity(.4)),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor.withOpacity(.4)),
              borderRadius: BorderRadius.circular(10),
            ),
            border: InputBorder.none,
            fillColor: textFieldColor,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: textColor.withOpacity(.7))),
      ),
    );
  }
}
