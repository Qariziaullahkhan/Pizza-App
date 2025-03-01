import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_app/controller/bottomnav_controller.dart';
import 'package:pizza_app/controller/check_box_controller.dart';
import 'package:pizza_app/controller/counter_controller.dart';
import 'package:pizza_app/utils/colors.dart';
import 'package:pizza_app/utils/responsive.dart';
import 'package:pizza_app/widgets/my_size.dart';
import 'package:pizza_app/widgets/mytext.dart';

class CartViewScreen extends StatelessWidget {
  final String imagePath;
  final String title;

  const CartViewScreen(
      {super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    final ResponsiveController responsive = Get.put(ResponsiveController());
    final CheckBoxController controller = Get.put(CheckBoxController());
    final CounterController counterController = Get.put(CounterController());
    final BottomNavController bottomNavController =
        Get.put(BottomNavController());

    return Scaffold(
      body: SingleChildScrollView(
        // Moved inside Scaffold
        child: Column(
          children: [
            Stack(
              children: [
                // Background Image Container
                Container(
                  width: double.infinity,
                  height: responsive.height(0.4), // 262 responsive
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Circular Close Button
                Positioned(
                  top: 27, // Adjust position as needed
                  left: 16, // Adjust position as needed
                  child: GestureDetector(
                    onTap: () {
                      Get.back(); // Close the page using GetX
                    },
                    child: Container(
                      width: 40, // Circular size
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        shape: BoxShape.circle, // Circular shape
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Icon(Icons.close,
                          color: AppColors.secondary), // Close icon
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 17),
                  child: MyText(
                    text: "Chicken Pizza (Small)",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: MyText(
                      text: "Rs. 100",
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            MySize(height: 1),
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: MyText(
                textAlign: TextAlign.start,
                text:
                    "Regular Pizza 6 inches, 2 pieces garlic bread &SOFT DRINK - 345 ",
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              width: double.infinity,
              height: 143,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyText(
                          text: "choose your Crust for 6 inch Pizza",
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: 14, // Fix height for the button
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero, // Remove default padding
                            minimumSize: Size(
                                50, 14), // Set minimum width & fixed height
                            backgroundColor: Colors.white, // Change as needed
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  100), // 100px border radius
                              side: BorderSide(
                                  color: Colors.grey, width: 1), // 1px border
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Required",
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  MySize(height: 1),
                  // to use checkbox and flat bread text and with also free text

                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller
                              .isChecked.value, // Bind value to controller
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return Colors
                                    .black; // Change background color when checked
                              }
                              return Colors
                                  .white; // Default color when unchecked
                            },
                          ),
                          onChanged: controller
                              .togglecheckbox, // Toggle checkbox state
                        ),
                      ),
                      MyText(
                          text: "Flat Bread",
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      const Spacer(),
                      MyText(
                          text: "Free",
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                            value: controller
                                .isvalues.value, // Bind value to controller
                            checkColor: Colors.white, // Tick mark color
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return Colors
                                      .black; // Change background color when checked
                                }
                                return Colors
                                    .white; // Default color when unchecked
                              },
                            ),
                            onChanged: (value) => controller
                                .toggle(value), // Toggle checkbox state
                          )),
                      MyText(
                          text: "Original Crust",
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      const Spacer(),
                      MyText(
                          text: "Free",
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ],
                  ),
                ],
              ),
            ),
            MySize(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              width: double.infinity,
              height: 143,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyText(
                          text: "choose your Crust for 6 inch Pizza",
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: 14, // Fix height for the button
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero, // Remove default padding
                            minimumSize: Size(
                                50, 14), // Set minimum width & fixed height
                            backgroundColor: Colors.white, // Change as needed
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  100), // 100px border radius
                              side: BorderSide(
                                  color: Colors.grey, width: 1), // 1px border
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "optional",
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  MySize(height: 1),
                  // to use checkbox and flat bread text and with also free text

                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        checkColor: Colors.black,
                        onChanged: (value) {},
                      ),
                      MyText(
                          text: "Flat Bread",
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      const Spacer(),
                      MyText(
                          text: "\$20",
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      MyText(
                          text: "Original Crust",
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      const Spacer(),
                      MyText(
                        text:
                            "\$100", // Use backslash (\) before $ to escape it
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                ],
              ),
            ),
            MySize(
              height: 22,
            ),
            MyText(
              text: "Special Instructions",
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
            // to container with text field
            MySize(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(left: 19, right: 15),
              width: double.infinity,
              height: 81,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Column(
                children: [
                  MyText(
                      text: "e.g no mayo",
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  MySize(height: 1),
                ],
              ),
            ),
            MySize(
              height: 10,
            ),
            // to container in row with decreament in increament button to increase and decrease values
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Increment-Decrement Buttons
                  Row(
                    children: [
                      // Decrease Button (-)
                      GestureDetector(
                        onTap: counterController.decrement,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.1), // Light red
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(Icons.remove, color: Colors.red),
                        ),
                      ),

                      // Counter Value
                      const SizedBox(width: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Obx(() => Text(
                              "${counterController.count.value}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                      ),
                      const SizedBox(width: 12),
                      // Increase Button (+)
                      GestureDetector(
                        onTap: counterController.increment,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: AppColors.secondary, // Solid red
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  // Add to Cart Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      final BottomNavController bottomNavController =
                          Get.find();
                      // OrderView ka index (1) par navigate karein
                      bottomNavController.changeTab(1);
                      // Add to cart logic here
                    },
                    child: Text("Add to Cart",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            MySize(
              height: 22,
            ),

            MySize(
              height: 22,
            ),
          ],
        ),
      ),
    );
  }
}
