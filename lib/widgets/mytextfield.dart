import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final Color? borderColor;
  final Color? textColor;
  final IconData? suffixIcon;

  const MyTextField({
    super.key,
    this.controller,
    this.prefixIcon,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.fillColor,
    this.borderColor,
    this.textColor,
    this.suffixIcon
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 15,
        color: textColor ?? Colors.black, // Default text color
      ),
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text, // Default input type
      textInputAction: textInputAction ?? TextInputAction.done, // Default action
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: borderColor ?? Colors.blue) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: borderColor ?? Colors.blue) : null,
        fillColor: fillColor ?? Colors.grey[200], // Default fill color
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: borderColor ?? Colors.blue, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: borderColor ?? Colors.blue, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: borderColor ?? Colors.blue, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText ?? "", // Default empty hint text
        hintStyle: TextStyle(fontSize: 15, color: textColor ?? Colors.black),
      ),
    );
  }
}
