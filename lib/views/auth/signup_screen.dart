import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/utils/colors.dart';
import 'package:pizza_app/utils/constants.dart';
import 'package:pizza_app/utils/responsive.dart';
import 'package:pizza_app/views/auth/login_view.dart';
import 'package:pizza_app/widgets/my_size.dart';
import 'package:pizza_app/widgets/mybutton.dart';
import 'package:pizza_app/widgets/myphone_field.dart';
import 'package:pizza_app/widgets/mytext.dart';
import 'package:pizza_app/widgets/mytextfield.dart';
import 'package:pizza_app/widgets/password_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final firstnameController = TextEditingController();
    final lastnameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>(); // Form key for validation

    final ResponsiveController responsive = Get.put(ResponsiveController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 25, top: 40),
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
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
                  MyText(
                    text: "First Name",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                  ),
                  MySize(height: responsive.height(0.002)),
                  MyTextField(
                    controller: firstnameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    fillColor: Colors.white,
                    borderColor: AppColors.grey,
                    textColor: Colors.black,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        // Safer check for null
                        return "Please enter your first name";
                      }
                      return null;
                    },
                  ),
                  MySize(height: responsive.height(0.02)),
                  MyText(
                    text: "Last Name",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                  ),
                  MySize(height: responsive.height(0.002)),
                  MyTextField(
                    controller: lastnameController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    fillColor: Colors.white,
                    borderColor: AppColors.grey,
                    textColor: Colors.black,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return "Please enter your last name";
                      }
                      return null;
                    },
                  ),
                  MySize(height: responsive.height(0.02)),
                  MyText(
                    text: "Email",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                  ),
                  MySize(height: responsive.height(0.002)),
                  MyTextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    fillColor: Colors.white,
                    borderColor: AppColors.grey,
                    textColor: Colors.black,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return "Please enter your email";
                      }
                      if (!p0.contains('@')) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                  ),
                  MySize(height: responsive.height(0.02)),
                  MyText(
                    text: "Phone Number",
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
                    validator: (phoneNumber) {
                      if (phoneNumber == null || phoneNumber.number.isEmpty) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
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
                    // validator: (p0) {
                    //   if (p0 == null || p0.isEmpty) {
                    //     return "Please enter your password";
                    //   }
                    //   return null;
                    // },
                  ),
                  MySize(height: 25),
                  Mybutton(
                      width:double.infinity,
                      height: responsive.height(0.07),
                      borderRadius: BorderRadius.circular(10),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Get.offAllNamed(
                              '/dashboard'); // Yeh previous stack hata kar home le jayega
                        }
                      },
                      text: Constants.register,
                      backgroundColor: AppColors.secondary,
                      textColor: Colors.white),
                  MySize(height: responsive.height(0.03)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(
                        text: Constants.already,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                      MySize(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () => Get.to(() => const Loginview()),
                        child: MyText(
                          text: Constants.signin,
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
      ),
    );
  }
}
