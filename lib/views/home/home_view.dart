import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/controller/product_controller.dart';
import 'package:pizza_app/utils/colors.dart';
import 'package:pizza_app/utils/constants.dart';
import 'package:pizza_app/utils/responsive.dart';
import 'package:pizza_app/views/cart/cart_view.dart';
import 'package:pizza_app/views/category/category_view.dart';
import 'package:pizza_app/widgets/my_size.dart';
import 'package:pizza_app/widgets/mytext.dart';
import 'package:pizza_app/widgets/pizza_card.dart';
import 'package:pizza_app/widgets/searchfiled.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponsiveController responsive = Get.put(ResponsiveController());
    final ProductController controller = Get.put(ProductController());

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
            // to write me container
            Column(
              children: controller.productCategories.keys.map((category) {
                return _buildCategorySection(
                    category, controller.productCategories[category]!);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCategorySection(String category, List products) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
    width: double.infinity,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
                text: category,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.primary),
            GestureDetector(
              onTap: () =>
                  Get.to(() => CategoryDetailScreen(categoryName: category)),
              child: Row(
                children: [
                  MyText(
                      text: "View All",
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: AppColors.secondary),
                  const Icon(Icons.arrow_forward_ios,
                      color: AppColors.secondary, size: 12),
                ],
              ),
            ),
          ],
        ),
        MySize(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: products
                .map((product) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () => Get.to(() => CartViewScreen(imagePath: product.imagePath,title: product.toString(),)),
                        child: PizzaCard(
                            imagePath: product.imagePath, title: product.title),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    ),
  );
}
