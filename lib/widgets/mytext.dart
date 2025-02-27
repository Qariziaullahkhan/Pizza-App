import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;
  final TextDecoration decoration;
  final Color? decorationColor; // Optional decoration color
  final TextAlign? textAlign;
  final double? letterSpacing;
  final double? height;
  final TextDecorationStyle? decorationStyle;

  const MyText({
    super.key,
    required this.text,
    this.fontSize = 5.0,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.fontStyle,
    this.decoration = TextDecoration.none,
    this.decorationColor,
    this.textAlign,
    this.letterSpacing,
    this.height,
    this.decorationStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      
      style: GoogleFonts.robotoFlex(
        fontSize: fontSize,
        color: color,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
        decorationColor: decorationColor,
        height: height,
        decorationStyle: decorationStyle
      ),
    );
  }
}
