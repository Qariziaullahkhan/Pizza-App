import 'package:get/get.dart';

class CounterController extends GetxController{

  var count = 1.obs;

  increment(){  
    count++;
  }
    decrement(){
      if(count > 0){
      count--;

      }
    }
}