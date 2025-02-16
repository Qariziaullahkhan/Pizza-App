import 'package:get/get.dart';

class ResponsiveController extends GetxController {
  double width(double percentage) {
    return (Get.width * percentage);
  }
  double height(double percentage) {
    return (Get.height * percentage);
  }
}