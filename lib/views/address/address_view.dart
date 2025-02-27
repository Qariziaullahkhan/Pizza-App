import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_app/utils/colors.dart';
import 'package:pizza_app/utils/constants.dart';
import 'package:pizza_app/utils/images.dart';
import 'package:pizza_app/widgets/custom_listtile.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

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
          Constants.address,
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
            title: 'CIA Apartments',
            subtitle1: 'Karachi, Sindh, Pakistan',
            subtitle2: 'Note to rider: none',
            leadingIcon: Images.local,
            editIcon: Images.edit,
            deleteIcon: Images.delete,
            onEdit: () {
              print("Edit button clicked");
            },
            onDelete: () {
              print("Delete button clicked");
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomListTile(
            title: ' B Block, Johar Town',
            subtitle1: 'Lahore, Punjab, Pakistan',
            subtitle2: 'Note to rider: none',
            leadingIcon: Images.local,
            editIcon: Images.edit,
            deleteIcon: Images.delete,
            onEdit: () {
              print("Edit button clicked");
            },
            onDelete: () {
              print("Delete button clicked");
            },
          ),
        ],
      ),
      floatingActionButton: Container(
  width: 50,
  height: 50,
  decoration: BoxDecoration(
    shape: BoxShape.circle, // Ensures the FAB remains circular
    color: AppColors.secondary, // Change this to match your theme
  ),
  child: FloatingActionButton(
    onPressed: () {},
    backgroundColor: Colors.transparent, // To avoid double background color
    elevation: 0, // Removes extra shadow
    child: Icon(Icons.add, size: 24, color: Colors.white),
  ),
)
    );
  }
}
