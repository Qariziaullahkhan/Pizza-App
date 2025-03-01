import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_app/controller/product_controller.dart';
import 'package:pizza_app/model/product_model.dart';
import 'package:pizza_app/utils/colors.dart';
import 'package:pizza_app/utils/constants.dart';
import 'package:pizza_app/utils/responsive.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Get.find<ResponsiveController>(); // Use Get.find()
    final controller = Get.find<ProductController>();

    List<ProductModel> products = [
      ProductModel(imagePath: 'assets/images/pizza.png', title: 'Chicken Pizza', price: 'Rs. 300'),
      ProductModel(imagePath: 'assets/images/fatija.png', title: 'Burger', price: 'Rs. 300'),
      ProductModel(imagePath: 'assets/images/pizza.png', title: 'Chicken Pizza', price: 'Rs. 300'),
      ProductModel(imagePath: 'assets/images/fatija.png', title: 'Burger', price: 'Rs. 300'),
      ProductModel(imagePath: 'assets/images/pizza.png', title: 'Chicken Pizza', price: 'Rs. 300'),
      ProductModel(imagePath: 'assets/images/fatija.png', title: 'Burger', price: 'Rs. 300'),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios, color: AppColors.secondary),
        ),
        title: Text(
          Constants.favourits,
          style: GoogleFonts.robotoFlex(
            color: AppColors.secondary,
            fontSize: responsive.width(0.045),
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
         

          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: responsive.width(0.04)),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: responsive.width(0.03),
                  mainAxisSpacing: responsive.height(0.02),
                  childAspectRatio: 0.75,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(responsive.width(0.015)),
                          color: AppColors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(responsive.width(0.015)),
                                child: Image.asset(
                                  product.imagePath,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(responsive.width(0.02)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title,
                                    style: TextStyle(
                                      fontSize: responsive.width(0.04),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: responsive.height(0.005)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        product.price,
                                        style: TextStyle(
                                          fontSize: responsive.width(0.035),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(responsive.width(0.01)),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.secondary,
                                        ),
                                        child: Icon(Icons.add, color: Colors.white, size: responsive.width(0.03)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: responsive.height(0.01),
                        right: responsive.width(0.01),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 2,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.favorite_border_sharp,
                            color: Colors.red,
                            size: responsive.width(0.04),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
