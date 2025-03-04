import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_app/controller/auth_controller.dart';
import 'package:pizza_app/utils/colors.dart';
import 'package:pizza_app/utils/constants.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback onLogout; // Add this parameter

  const LogoutDialog({super.key, required this.onLogout}); // Update constructor

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 328, // Fixed width
        height: 196, // Fixed height
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textAlign: TextAlign.start,
              Constants.logout,
              style: GoogleFonts.robotoFlex(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              Constants.logoutMessage,
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoFlex(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back(); // Close the dialog
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(50, 44),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                  ),
                  child: Text(
                    Constants.cancel,
                    style: GoogleFonts.sourceSans3(
                        color: AppColors.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 16),
                Obx(() {
                  return ElevatedButton(
                    onPressed: authController.isLoggedOut.value
                        ? null // Disable button if logout is in progress
                        : onLogout, // Use the passed logout function
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(87, 44),
                      backgroundColor: authController.isLoggedOut.value
                          ? Colors
                              .grey // Change button color if logout is in progress
                          : AppColors.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                    ),
                    child: authController.isLoggedOut.value
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          ) // Show loading indicator
                        : Text(
                            Constants.logout,
                            style: GoogleFonts.sourceSans3(
                                color: Color(0xFFDEDAD5),
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
