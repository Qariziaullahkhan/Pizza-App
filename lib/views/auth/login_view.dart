import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/controller/auth_controller.dart';
import 'package:pizza_app/roots/app_routes.dart';
import 'package:pizza_app/utils/colors.dart';
import 'package:pizza_app/utils/constants.dart';
import 'package:pizza_app/utils/responsive.dart';
import 'package:pizza_app/widgets/my_size.dart';
import 'package:pizza_app/widgets/mybutton.dart';
import 'package:pizza_app/widgets/myphone_field.dart';
import 'package:pizza_app/widgets/mytext.dart';
import 'package:pizza_app/widgets/password_field.dart';

class LoginView extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final ResponsiveController responsive = Get.put(ResponsiveController());

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  // Add a GlobalKey for the form
  final _formKey = GlobalKey<FormState>();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 25, top: 40),
          child: Form(
            key: _formKey, // Assign the form key
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                // Phone Number Field
                MyText(
                  text: Constants.mobile,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
                MyPhoneField(
                  controller: phoneController,
                 validator: (value) {
                    if (value == null || value.number.isEmpty) {
                      return "Please enter your phone number";
                    }
                    return null;
                  },
                  fillColor: Colors.white, // Custom background color
                  textColor: Colors.black, // Custom text color
                ),
                // MySize(height: responsive.height(0.02)),
                // // Password Field
                // MyText(
                //   text: "Password",
                //   fontSize: 12,
                //   fontWeight: FontWeight.w500,
                //   color: AppColors.grey,
                // ),
                // MyPasswordField(
                //   controller: passwordController,
                //   isPassword: true,
                //   fillColor: Colors.white,
                //   borderColor: AppColors.grey,
                //   textColor: Colors.black,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return "Please enter your password";
                //     }
                //     return null;
                //   },
                // ),
                MySize(height: responsive.height(0.02)),
                // Forgot Password
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.forgotPassword),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: MyText(
                      text: Constants.forget,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
                MySize(height: 25),
                // Login Button
                Obx(() {
                  return authController.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : MyButton(
                          width: responsive.width(0.9),
                          height: responsive.height(0.07),
                          text: Constants.login,
                          backgroundColor: AppColors.secondary,
                          onPressed: () {
                            // Validate the form
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, proceed with login
                              authController.loginUser(phoneController.text,);
                            }
                          },
                        );
                }),
                MySize(height: 25),
                // Navigate to Register Screen
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      text: Constants.dont,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                    MySize(width: 5),
                    InkWell(
                      onTap: () => Get.toNamed("/register"),
                      child: MyText(
                        text: Constants.singup,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}