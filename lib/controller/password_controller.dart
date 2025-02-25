import 'package:get/get.dart';

class PasswordController extends GetxController {
  var isPasswordVisible = false.obs; // Observable variable

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}

