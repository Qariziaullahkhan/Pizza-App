import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/utils/colors.dart';
import 'package:pizza_app/utils/constants.dart';
import 'package:pizza_app/utils/responsive.dart';
import 'package:pizza_app/widgets/my_size.dart';
import 'package:pizza_app/widgets/mybutton.dart';
import 'package:pizza_app/widgets/mytext.dart';
import 'package:pizza_app/widgets/mytextfield.dart';

class Forgotview extends StatelessWidget {
  const Forgotview({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final ResponsiveController responsive = Get.put(ResponsiveController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios,color: AppColors.secondary,)),
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
                  text: Constants.forgot,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
                MySize(height: responsive.height(0.002)),
                MyText(
                  text: Constants.enteredemail,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
                MySize(height: responsive.height(0.02)),

                // MySize(height: responsive.height(0.002)),

                MyText(
                  text: "Your Email",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
                MySize(height: responsive.height(0.002)),
                MyTextField(
                  controller: emailController,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  fillColor: Colors.white,
                  borderColor: AppColors.grey,
                  textColor: Colors.black,
                  suffixIcon: Icons.visibility_off_outlined,
                ),

                MySize(height: 25),
                MyButton(
                    width: responsive.width(0.9),
                    height: responsive.height(0.07),
                    borderRadius: BorderRadius.circular(10),
                    onPressed: () {
                      Get.toNamed('/otp');
                    },
                    text: Constants.verfication,
                    backgroundColor: AppColors.secondary,
                    textColor: Colors.white),
                MySize(height: responsive.height(0.03)),

                //
              ]),
        ),
      ),
    );
  }
}
