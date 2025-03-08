
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart'; // Import for PhoneNumber type

class MyPhoneField extends StatelessWidget {
  final TextEditingController controller;
  final String initialCountryCode;
  final Color fillColor;
  final Color borderColor;
  final Color textColor;
  final bool showDropdownIcon;
  final bool showCountryFlag;
  final Function(String)? onChanged;
  final String? Function(PhoneNumber?)? validator; 

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
    this.validator, // Keep it here
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      
      controller: controller,
      disableLengthCheck: true,
      showCountryFlag: showCountryFlag,
      initialCountryCode: initialCountryCode,
      showDropdownIcon: showDropdownIcon,
      validator: validator, 
      dropdownIcon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      onChanged: (phone) => onChanged?.call(phone.completeNumber),
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        hintText: "Phone Number",
        hintStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: textColor.withOpacity(0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: borderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: borderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: borderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        errorStyle: TextStyle(color: Colors.red, fontSize: 12),
      ),
    );
  }
}
