import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_app/utils/colors.dart';
import 'package:pizza_app/utils/constants.dart';
import 'package:pizza_app/utils/images.dart';
import 'package:pizza_app/widgets/custom_listtile.dart';
import 'package:pizza_app/widgets/my_size.dart';
import 'package:pizza_app/widgets/mybutton.dart';
import 'package:pizza_app/widgets/mytext.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.secondary,
            )),
        title: Text(
          Constants.yourcart,
          style: GoogleFonts.robotoFlex(
              color: AppColors.secondary,
              fontSize: 17,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        CustomListTile(
            title: 'Chicken Pizza',
            borderRadius: BorderRadius.circular(10),
            width: 70,
            height: 70,
            subtitle1: 'Rs. 30',
            subtitleFontSize: 14,
            color: AppColors.secondary,
            subtitle2: 'Lorem ipsum dolor sit ',
            leadingIcon: Images.orderpizza,
              useCounter: true, // Enables increment & decrement buttons

            onIncrement: () {},
            onDecrement: () {}),
        MySize(
          height: 17,
        ),
        CustomListTile(
            title: 'Chicken Pizza',
            borderRadius: BorderRadius.circular(10),
            width: 70,
            height: 70,
            subtitle1: 'Rs. 30',
            subtitleFontSize: 14,
            color: AppColors.secondary,
            subtitle2: 'Lorem ipsum dolor sit ',
            leadingIcon: Images.orderpizza,
              useCounter: true, // Enables increment & decrement buttons

            onIncrement: () {},
            onDecrement: () {}),
        MySize(
          height: 17,
        ),
        //+ button and add more item text
        Row(
          children: [
            IconButton(
              iconSize: 20,
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: AppColors.primary,
              ),
            ),
            MySize(
              width: 10,
            ),
            Text(
              Constants.additem,
              style: GoogleFonts.roboto(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
            ),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: MyText(
              text: Constants.applycode,
              fontSize: 16,
              decoration: TextDecoration.underline,
              fontStyle: FontStyle.italic,
              color: AppColors.secondary,
              fontWeight: FontWeight.w700),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Constants.subtotal,
                style: GoogleFonts.roboto(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              ),
              Text(
                "Rs.280",
                style: GoogleFonts.roboto(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        MySize(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Constants.deliverycharges,
                style: GoogleFonts.roboto(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              ),
              Text(
                "Rs.20",
                style: GoogleFonts.roboto(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        MySize(
          height: 5,
        ),

        Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Constants.subtotal,
                style: GoogleFonts.roboto(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 13),
              ),
              Text(
                "Rs.300",
                style: GoogleFonts.roboto(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Mybutton(
            backgroundColor: AppColors.secondary,
            onPressed: () {},
            text: Constants.confirmpayment,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ]),
    );
  }
}
