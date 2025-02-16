import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color iconColor;
  final Color textColor;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;

  const CustomBackButton({
    super.key,
    this.onTap,
    this.iconColor = Colors.black,
    this.textColor = Colors.black,
    this.text = "Sign In",
    this.fontSize = 20,
    this.fontWeight = FontWeight.w700,
    this.fontStyle = FontStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: iconColor,
            ),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontStyle: fontStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
