import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/utils/colors.dart';
import 'package:pizza_app/utils/constants.dart';
import 'package:pizza_app/utils/responsive.dart';
import 'package:pizza_app/widgets/my_size.dart';
import 'package:pizza_app/widgets/mytext.dart';
import 'package:pizza_app/widgets/searchfiled.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponsiveController responsive = Get.put(ResponsiveController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.location_on, color: AppColors.secondary),
          onPressed: () {},
        ),
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyText(
                  text: Constants.delivery,
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondary,
                ),
                MySize(width: 3),
                const Icon(Icons.keyboard_arrow_down,
                    color: Colors.black, size: 20),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: MyText(
                text: Constants.addressLine,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none,
                color: AppColors.secondary),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // 🔎 Search Field
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                SearchField(
                  controller: TextEditingController(),
                  fillColor: Colors.white,
                  borderColor: Colors.grey,
                  textColor: Colors.black,
                  hintText: "Search Products...",
                  onTap: () {
                    print("Search Field Clicked");
                  },
                ),
                MySize(width: 10),
                // 🔲 Filter Button
                Container(
                  width: responsive.width(0.1),
                  height: responsive.height(0.05),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.filter_list,
                        color: Colors.white, size: 20),
                    onPressed: () {
                      print("Filter Button Clicked");
                    },
                  ),
                ),
              ],
            ),
          ),

          // 📌 Display Current Selected Tab
          // Expanded(
          //   child: Obx(() {
          //     return Center(
          //       child: Text(
          //         "Selected Tab: ${bottomNavController.currentIndex.value}",
          //         style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //       ),
          //     );
          //   }),
          // ),
        ],
      ),
    );
  }
}
