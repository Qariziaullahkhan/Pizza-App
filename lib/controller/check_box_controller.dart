import 'package:get/get.dart';

class CheckBoxController  extends GetxController{
  var isChecked = false.obs;
  var isvalues = false.obs;
  void togglecheckbox(bool? value) {
    isChecked.value = !isChecked.value;
  }
   void toggle(bool? values) {
    isvalues.value = !isvalues.value;
  }
}