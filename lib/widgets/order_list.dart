import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_app/utils/colors.dart';

class CustomListTileView extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const CustomListTileView({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        
        
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        leading: Stack(
          alignment: Alignment.center,
          children: [
            // Blurred Background Circle
            ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Adjust blur strength
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFB80A19).withOpacity(0.1),
                  ),
                ),
              ),
            ),
            // Clear Image on Top
            ClipOval(
              child: Image.asset(
                imagePath,
                width: 26,
                height: 25,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        title: Text(
          title,
          style: GoogleFonts.robotoFlex(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            subtitle,
            style: GoogleFonts.robotoFlex(
             color:AppColors.black,
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color:AppColors.black, size: 20),
      ),
    );
  }
}
