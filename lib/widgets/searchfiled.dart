import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final Color fillColor;
  final Color borderColor;
  final Color textColor;
  final String hintText;
  final VoidCallback? onTap;

  const SearchField({
    super.key,
    required this.controller,
    required this.fillColor,
    required this.borderColor,
    required this.textColor,
    required this.hintText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: borderColor,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: borderColor,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: borderColor,
              width: 2.0,
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.robotoFlex(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        style: TextStyle(color: textColor),
        onTap: onTap,
      ),
    );
  }
}
