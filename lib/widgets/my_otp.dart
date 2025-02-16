import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:pizza_app/utils/colors.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onCompleted;

  const OtpInput({super.key, required this.controller, this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      controller: controller,
      defaultPinTheme: PinTheme(
        width: 46,
        height: 48,
        textStyle: GoogleFonts.robotoFlex(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColors.grey), // Default gray border
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 46,
        height: 48,
        textStyle: GoogleFonts.robotoFlex(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColors.secondary, width: 2), // Highlight active field
        ),
      ),
      submittedPinTheme: PinTheme(
        width: 46,
        height: 48,
        textStyle: GoogleFonts.robotoFlex(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColors.secondary, width: 2), // Red border when filled
        ),
      ),
      onCompleted: onCompleted,
    );
  }
}
