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

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final firstnameController = TextEditingController();
    final lastnameController = TextEditingController();
    final emailController = TextEditingController();
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
                ),
                MySize(height: responsive.height(0.02)),
                MyText(
                  text: "Password",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                ),
                MySize(height: responsive.height(0.002)),
                MyTextField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  fillColor: Colors.white,
                  borderColor: AppColors.grey,
                  textColor: Colors.black,
                  suffixIcon: Icons.visibility_off_outlined,
                ),
                MySize(height: 25),
                Mybutton(
                    width: responsive.width(0.9),
                    height: responsive.height(0.07),
                    borderRadius: BorderRadius.circular(10),
                    onPressed: () {
                      Get.toNamed('/login');
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
    );
  }
}
