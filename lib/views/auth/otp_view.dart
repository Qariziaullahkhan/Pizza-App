import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/utils/colors.dart';
import 'package:pizza_app/utils/constants.dart';
import 'package:pizza_app/utils/responsive.dart';
import 'package:pizza_app/views/auth/reset_password_view.dart';
import 'package:pizza_app/widgets/my_otp.dart';
import 'package:pizza_app/widgets/my_size.dart';
import 'package:pizza_app/widgets/mybutton.dart';
import 'package:pizza_app/widgets/mytext.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final otpcontroller = TextEditingController();
    final ResponsiveController responsive = Get.put(ResponsiveController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.secondary,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 25, top: 40),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // MySize(height: responsive.height(0.09)),
                MyText(
                  text: Constants.emailverify,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
                MySize(height: responsive.height(0.002)),
                MyText(
                  text: Constants.digitcode,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
                MySize(height: responsive.height(0.03)),
                OtpInput(
                  controller: otpcontroller,
                  onCompleted: (p0) {},
                ),
                // MySize(height: responsive.height(0.002)),

                MySize(height: 25),
                Mybutton(
                    width: responsive.width(0.9),
                    height: responsive.height(0.07),
                    borderRadius: BorderRadius.circular(10),
                    onPressed: () {
                      Get.toNamed('/reset');
                    },
                    text: Constants.verify,
                    backgroundColor: AppColors.secondary,
                    textColor: Colors.white),
                MySize(height: responsive.height(0.03)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      text: Constants.resend,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.grey,
                    ),
                    MyText(
                      text: Constants.resendemial,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary,
                      decorationColor: AppColors.secondary,
                      decoration: TextDecoration.underline,
                    ),
                  ],
                ),

                //
              ]),
        ),
      ),
    );
  }
}
