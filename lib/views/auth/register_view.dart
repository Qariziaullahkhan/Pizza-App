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
import 'package:pizza_app/widgets/mytextfield.dart';
import 'package:pizza_app/widgets/password_field.dart';

class RegisterView extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final ResponsiveController responsive = Get.put(ResponsiveController());

  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 25, top: 40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MySize(height: responsive.height(0.09)),
                MyText(
                  text: Constants.account,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
                MySize(height: responsive.height(0.002)),
                MyText(
                  text: Constants.flavour,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
                MySize(height: responsive.height(0.02)),
                // First Name Field
                MyText(
                  text: "First Name",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
                MyTextField(
                  controller: firstnameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  fillColor: Colors.white,
                  borderColor: AppColors.grey,
                  textColor: Colors.black,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your first name";
                    }
                    return null;
                  },
                ),
                MySize(height: responsive.height(0.02)),
                // Last Name Field
                MyText(
                  text: "Last Name",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
                MyTextField(
                  controller: lastnameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  fillColor: Colors.white,
                  borderColor: AppColors.grey,
                  textColor: Colors.black,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your last name";
                    }
                    return null;
                  },
                ),
                MySize(height: responsive.height(0.02)),
                // Email Field
                MyText(
                  text: "Email",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
                MyTextField(
                  controller: emailController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  fillColor: Colors.white,
                  borderColor: AppColors.grey,
                  textColor: Colors.black,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    if (!value.contains('@')) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                ),
                MySize(height: responsive.height(0.02)),
                // Phone Number Field
                MyText(
                  text: "Phone Number",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
                MyPhoneField(
                  controller: phoneController, // Yeh main controller use karega
                  validator: (phoneNumber) {
                    if (phoneNumber == null || phoneNumber.number.isEmpty) {
                      return "Please enter your phone number";
                    }
                    if (phoneNumber.completeNumber.length < 10) {
                      // Minimum length check
                      return "Please enter a valid phone number";
                    }
                    return null;
                  },
                  fillColor: Colors.white,
                  borderColor: AppColors.grey,
                  textColor: Colors.black,
                ),

                MySize(height: responsive.height(0.02)),
                // Password Field
                MyText(
                  text: "Password",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
                MyPasswordField(
                  controller: passwordController,
                  isPassword: true,
                  borderColor: AppColors.grey,
                  textColor: Colors.black,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                MySize(height: 25),
                // Register Button
                Obx(() {
                  return authController.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : MyButton(
                          width: responsive.width(0.9),
                          height: responsive.height(0.07),
                          backgroundColor: AppColors.secondary,
                          text: Constants.register,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Save user data to the controller
                              authController.firstName.value =
                                  firstnameController.text;
                              authController.lastName.value =
                                  lastnameController.text;
                              authController.email.value = emailController.text;
                              authController.phoneNumber.value =
                                  phoneController.text;
                              authController.password.value =
                                  passwordController.text;

                              // Send OTP
                              authController.sendOtp(phoneController.text);
                            }
                          },
                        );
                }),
                MySize(height: responsive.height(0.03)),
                // Error Message

                // Navigate to Login Screen
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      text: Constants.already,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                    MySize(width: 5),
                    InkWell(
                      onTap: () => Get.toNamed(AppRoutes.login),
                      child: MyText(
                        text: Constants.signin,
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
