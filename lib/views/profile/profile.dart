import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_app/utils/colors.dart';
import 'package:pizza_app/utils/constants.dart';
import 'package:pizza_app/utils/images.dart';
import 'package:pizza_app/widgets/order_list.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: AppColors.secondary), // Leading Icon
          onPressed: () {
            Get.back(); // Back Navigation
          },
        ),
        title: Text(
          Constants.profile,
          style: GoogleFonts.robotoFlex(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: AppColors.secondary,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 36, right: 33),
            width: double.infinity,
            height: 89,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.secondary,
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Itunuoluwa Abidoye",
                    style: GoogleFonts.robotoFlex(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    "@Itunuoluwa",
                    style: GoogleFonts.robotoFlex(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: GestureDetector(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset(Images.edit,
                          color: Colors.white, fit: BoxFit.contain),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomListTileView(
              imagePath: "assets/images/order.png",
              title: "My Orders",
              subtitle: "Stay Updated on Your Orders, Instantly!"),
          CustomListTileView(
              imagePath: "assets/images/lock.png",
              title: "Change Password",
              subtitle: "Secure Your Access"),
          CustomListTileView(
              imagePath: "assets/images/terms.png",
              title: "Terms and Conditions",
              subtitle: "Know Your Rights & Responsibilities"),
          CustomListTileView(
              imagePath: "assets/images/logout.png",
              title: "Log out",
              subtitle: "Ready to take a break? Log out securely!"),
        ],
      ),
    );
  }
}
