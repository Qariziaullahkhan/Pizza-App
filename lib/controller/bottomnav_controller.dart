import 'package:get/get.dart';
import 'package:pizza_app/views/address/address_view.dart';
import 'package:pizza_app/views/favrourite/favourite.dart';
import 'package:pizza_app/views/dashboard/dashboard_view.dart';
import 'package:pizza_app/views/order/order_view.dart';
import 'package:pizza_app/views/profile/profile.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;
  final screens = [
    const DashboardView(),
     OrderView(),
    const FavouriteView(),
    const AddressView(),
    const ProfileView(),
  ];

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
