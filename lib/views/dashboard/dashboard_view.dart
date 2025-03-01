import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/controller/bottomnav_controller.dart';
import 'package:pizza_app/utils/colors.dart';
import 'package:pizza_app/utils/constants.dart';
import 'package:pizza_app/utils/images.dart';
import 'package:pizza_app/utils/responsive.dart';
import 'package:pizza_app/views/address/address_view.dart';
import 'package:pizza_app/views/favrourite/favourite.dart';
import 'package:pizza_app/views/home/home_view.dart';
import 'package:pizza_app/views/order/order_view.dart';
import 'package:pizza_app/views/profile/profile.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController =
        Get.put(BottomNavController());
    final ResponsiveController responsive = Get.put(ResponsiveController());
    final BottomNavController controller = Get.find();

    final List<Widget> screens = [
      const HomeView(),
       OrderView(),
      const FavouriteView(),
      const AddressView(),
      const ProfileView(),
    ];
    return Scaffold(
      body: Obx(() => screens[bottomNavController.currentIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeTab,
            selectedItemColor: AppColors.secondary,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(Images.home)),
                  label: Constants.home),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(Images.cart)), label: Constants.cart),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(Images.favourite)),
                  label: Constants.favourits),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(Images.address)),
                  label: Constants.address),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(Images.profile)),
                  label: Constants.profile),
            ],
          ),
          ),
    );
    //////////
  }
}
