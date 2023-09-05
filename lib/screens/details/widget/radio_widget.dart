import 'package:flutter/material.dart';
import 'package:partymania_owners/utils/colors.dart';

class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final IconData leading;
  final Widget? title;
  final ValueChanged<T?> onChanged;

  const MyRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        height: 56,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            _customRadioButton,
            SizedBox(width: 2),
            if (title != null) title,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? otpColor : null,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isSelected ? otpColor : Colors.grey[300]!,
          width: 2,
        ),
      ),
      child: Icon(
        leading,
        color: colorBlack,
      ),
    );
  }
}
