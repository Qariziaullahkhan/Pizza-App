import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class MyPhoneField extends StatelessWidget {
  final TextEditingController controller;
  final String initialCountryCode;
  final Color fillColor;
  final Color borderColor;
  final Color textColor;
  final bool showDropdownIcon;
  final bool showCountryFlag;
  final Function(String)? onChanged;

  const MyPhoneField({
    super.key,
    required this.controller,
    this.initialCountryCode = "IN",
    this.fillColor = Colors.white,
    this.borderColor = Colors.grey,
    this.textColor = Colors.black,
    this.showCountryFlag = true,
    this.showDropdownIcon = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      disableLengthCheck: true,
      showCountryFlag: showCountryFlag, // ✅ Show country flag
            initialCountryCode: initialCountryCode,

      showDropdownIcon: showDropdownIcon, // ✅ Show dropdown arrow
      autovalidateMode: AutovalidateMode.disabled,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      onChanged: (phone) => onChanged?.call(phone.completeNumber),
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        hintStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: textColor,
        ),
      ),
    );
  }
}
