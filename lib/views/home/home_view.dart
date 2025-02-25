import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/utils/colors.dart';
import 'package:pizza_app/utils/constants.dart';
import 'package:pizza_app/utils/responsive.dart';
import 'package:pizza_app/widgets/burger_card.dart';
import 'package:pizza_app/widgets/chocklate_card.dart';
import 'package:pizza_app/widgets/my_size.dart';
import 'package:pizza_app/widgets/mytext.dart';
import 'package:pizza_app/widgets/pizza_card.dart';
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
            Container(
              margin: const EdgeInsets.only(
                left: 18,
                right: 10,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyText(
                        text: Constants.pizaa,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                      Spacer(),
                      MyText(
                        text: "view all",
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: AppColors.secondary,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.secondary,
                        size: 12,
                      ),
                      MySize(width: 10),
                    ],
                  ),
                  MySize(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        PizzaCard(
                          imagePath: "assets/images/pizza.png",
                          title: "Chicken Pizza",
                        ),
                        MySize(width: 10),
                        PizzaCard(
                          imagePath: "assets/images/fatija.png",
                          title: "Fajita Pizza",
                        ),
                        MySize(width: 10),
                        PizzaCard(
                          imagePath: "assets/images/supreem.png",
                          title: "Supreme Pizza",
                        ),
                      ],
                    ),
                  )
                  ////to removed oveflow
                ],
              ),
            ),
            //burgers
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 18,
                right: 10,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyText(
                        text: Constants.burger,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                      Spacer(),
                      MyText(
                        text: "view all",
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: AppColors.secondary,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.secondary,
                        size: 12,
                      ),
                      MySize(width: 10),
                    ],
                  ),
                  MySize(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        BurgerCard(
                          imagePath: "assets/images/chicken.png",
                          title: "Chicken Burger",
                        ),
                        MySize(width: 5),
                        PizzaCard(
                          imagePath: "assets/images/beef.png",
                          title: "Beef Burger",
                        ),
                        MySize(width: 5),
                        PizzaCard(
                          imagePath: "assets/images/pretty.png",
                          title: "Pretty Burger",
                        ),
                      ],
                    ),
                  )

                  ////to removed oveflow
                ],
              ),
            ),
            MySize(height: 10),
            Container(
              margin: const EdgeInsets.only(
                left: 18,
                right: 10,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyText(
                        text: Constants.cake,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                      Spacer(),
                      MyText(
                        text: "view all",
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: AppColors.secondary,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.secondary,
                        size: 12,
                      ),
                      MySize(width: 10),
                    ],
                  ),
                  MySize(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CakeCards(
                          imagePath: "assets/images/chocklate.png",
                          title: "Chocklate Cake",
                        ),
                        MySize(width: 10),
                        CakeCards(
                          imagePath: "assets/images/cramel.png",
                          title: "Caramel Cake",
                        ),
                        MySize(width: 10),
                        CakeCards(
                          imagePath: "assets/images/strewbery.png",
                          title: "Strawberry Cake",
                        ),
                      ],
                    ),
                  )
                  ////to removed oveflow
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
