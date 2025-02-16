import 'package:get/get.dart';
import 'package:pizza_app/views/address/address_view.dart';
import 'package:pizza_app/views/favrourite/favourite.dart';
import 'package:pizza_app/views/home/dashboard_view.dart';
import 'package:pizza_app/views/order/order_view.dart';
import 'package:pizza_app/views/profile/profile.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;
  final screes = [
    const DashboardView(),
    const OrderView(),
    const FavouriteView(),
    const AddressView(),
    const ProfileView(),
  ];

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
