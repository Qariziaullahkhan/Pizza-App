import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/utils/colors.dart';
import 'package:pizza_app/utils/constants.dart';
import 'package:pizza_app/utils/responsive.dart';
import 'package:pizza_app/views/auth/login_view.dart';
import 'package:pizza_app/widgets/my_size.dart';
import 'package:pizza_app/widgets/mybutton.dart';
import 'package:pizza_app/widgets/mytext.dart';

class DoneView extends StatelessWidget {
  const DoneView({super.key});

  @override

  Widget build(BuildContext context) {
    final ResponsiveController responsive = Get.put(ResponsiveController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 96,
              height: 98,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondary,
              ),
              child: const Center(
                child: Icon(
                  Icons.check,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
            MySize(height: responsive.height(0.02)),
            MyText(
              text: Constants.passwrordresset,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.grey,
              textAlign: TextAlign.center,
              letterSpacing: 0,
            ),
            MySize(height: responsive.height(0.02)),
           MyButton(
            width: responsive.width(0.9),
            height: responsive.height(0.07),
            backgroundColor: AppColors.secondary,
            onPressed: () => Get.to(() => LoginView()), text: "Done"),
          ],
        ),
      ),
    );
  }
}
