import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/utils/colors.dart';
import 'package:pizza_app/utils/constants.dart';
import 'package:pizza_app/utils/responsive.dart';
import 'package:pizza_app/views/auth/done_view.dart';
import 'package:pizza_app/widgets/my_size.dart';
import 'package:pizza_app/widgets/mybutton.dart';
import 'package:pizza_app/widgets/mytext.dart';
import 'package:pizza_app/widgets/mytextfield.dart';

class ResetPasswordview extends StatelessWidget {
  const ResetPasswordview({super.key});

  @override
  Widget build(BuildContext context) {
    final newpasswordController = TextEditingController();
        final confirmpasswordController = TextEditingController();

    final ResponsiveController responsive = Get.put(ResponsiveController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 25, top: 40),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MySize(height: responsive.height(0.09)),
                MyText(
                  text: Constants.setnew,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
                MySize(height: responsive.height(0.002)),
                MyText(
                  text: Constants.createnew,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
              
            
                MySize(height: responsive.height(0.02)),
                MyText(
                  text: "New Password",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
                MySize(height: responsive.height(0.002)),
                MyTextField(
                  controller: newpasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  hintText: "Enter your password",
                  textInputAction: TextInputAction.done,
                  fillColor: Colors.white,
                  borderColor: AppColors.grey,
                  textColor: AppColors.grey,
                  suffixIcon: Icons.visibility_off_outlined,
                ),
                     MySize(height: responsive.height(0.02)),
                MyText(
                  text: "Confirm Password",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
                MySize(height: responsive.height(0.002)),
                MyTextField(
                  controller: confirmpasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  hintText: "Re-enter password",
                  textInputAction: TextInputAction.done,
                  fillColor: Colors.white,
                  borderColor: AppColors.grey,
                  textColor: AppColors.grey,
                  suffixIcon: Icons.visibility_off_outlined,
                ),
               
                MySize(height: 25),
                Mybutton(
                    width: responsive.width(0.9),
                    height: responsive.height(0.07),
                    borderRadius: BorderRadius.circular(10),
                    onPressed: () {
                      Get.toNamed('/done');
                    },
                    text: Constants.resetpassword,
                    backgroundColor: AppColors.secondary,
                    textColor: Colors.white),
               
              ]),
        ),
      ),
    );
  }
}
