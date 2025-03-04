import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/controller/password_controller.dart';

class MyPasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final Color? borderColor;
  final Color? textColor;
  final String? Function(String?)? validator;
  final bool isPassword;

  const MyPasswordField({
    super.key,
    this.controller,
    this.prefixIcon,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.fillColor,
    this.borderColor,
    this.textColor,
    this.validator,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    final passwordController = Get.find<PasswordController>();
    return Obx(() => TextFormField(
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.text,
          textInputAction: textInputAction ?? TextInputAction.done,
          obscureText: isPassword ? !passwordController.isPasswordVisible.value : false,
          validator: validator,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: borderColor ?? Colors.blue)
                : null,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      passwordController.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: borderColor ?? Colors.blue,
                    ),
                    onPressed: passwordController.togglePasswordVisibility,
                  )
                : null,
            fillColor: fillColor ?? Colors.grey[200],
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: borderColor ?? Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: borderColor ?? Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText ?? "",
            hintStyle: TextStyle(fontSize: 15, color: textColor ?? Colors.black),
          ),
        ));
  }
}
