import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_app/utils/colors.dart';
import 'package:pizza_app/utils/constants.dart';
import 'package:pizza_app/utils/images.dart';
import 'package:pizza_app/widgets/custom_listtile.dart';
import 'package:pizza_app/widgets/my_size.dart';

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
      body: Column(
        children: [
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
            editIcon: Images.edit,
            deleteIcon: Images.delete,
            onEdit: () {
              print("Edit button clicked");
            },
            onDelete: () {
              print("Delete button clicked");
            },
          ),
          MySize(height: 17,),
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
            editIcon: Images.edit,
            deleteIcon: Images.delete,
            onEdit: () {
              print("Edit button clicked");
            },
            onDelete: () {
              print("Delete button clicked");
            },
          ),

                ]
              
            ),
          );
      
  }
}