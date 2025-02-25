import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/utils/colors.dart';
import 'package:pizza_app/utils/constants.dart';
import 'package:pizza_app/utils/responsive.dart';
import 'package:pizza_app/views/auth/signup_screen.dart';
import 'package:pizza_app/widgets/my_size.dart';
import 'package:pizza_app/widgets/mybutton.dart';
import 'package:pizza_app/widgets/myphone_field.dart';
import 'package:pizza_app/widgets/mytext.dart';
import 'package:pizza_app/widgets/password_field.dart';

class Loginview extends StatelessWidget {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();
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
                  text: Constants.signininto,
                  fontSize: 22,
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
                MyText(
                  text: Constants.mobile,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
                MySize(height: responsive.height(0.002)),
                MyPhoneField(
                  controller: phoneController,
                  fillColor: Colors.white,
                  borderColor: Colors.grey,
                  textColor: Colors.black,
                  showCountryFlag: true,
                  showDropdownIcon: true,
                  onChanged: (value) {
                    // print("Phone number: $value");
                  },
                ),
                MySize(height: responsive.height(0.02)),
                MyText(
                  text: "Password",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
                MySize(height: responsive.height(0.002)),
                MyPasswordField(
                  controller: passwordController,
                  fillColor: Colors.white,
                  borderColor: Colors.grey,
                  textColor: Colors.black,
                  isPassword: true,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                ),
                MySize(height: responsive.height(0.02)),
                GestureDetector(
                  onTap: () => Get.toNamed('/forgot'),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: MyText(
                          text: Constants.forget,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondary)),
                ),
                MySize(height: 25),
                Mybutton(
                    width: responsive.width(0.9),
                    height: responsive.height(0.07),
                    borderRadius: BorderRadius.circular(10),
                    onPressed: () {
                      Get.offAllNamed('/dashboard');
                    },
                    text: Constants.login,
                    backgroundColor: AppColors.secondary,
                    textColor: Colors.white),
                MySize(height: responsive.height(0.03)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      text: Constants.dont,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                    MySize(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () => Get.to(() => RegisterView()),
                      child: MyText(
                        text: Constants.singup,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
