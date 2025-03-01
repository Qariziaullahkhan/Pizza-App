import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_app/controller/order_controller.dart';
import 'package:pizza_app/utils/colors.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String? leadingIcon;
  final String? editIcon;
  final String? deleteIcon;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final bool useCounter; // Flag to switch trailing options
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? color;
  final FontWeight? fontWeight;
  final double? subtitleFontSize;

  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    this.leadingIcon,
    this.editIcon,
    this.deleteIcon,
    this.onEdit,
    this.onDelete,
    this.onIncrement,
    this.onDecrement,
    this.useCounter = false, // Default: Edit/Delete
    this.width,
    this.height,
    this.borderRadius,
    this.color,
    this.fontWeight,
    this.subtitleFontSize,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            spreadRadius: -2,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: leadingIcon != null
            ? Container(
                width: width ?? 40,
                height: height ?? 40,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  // color: Colors.grey.shade200,
                ),
                child: ClipRRect(
                  borderRadius: borderRadius ?? BorderRadius.zero,
                  child: Image.asset(
                    leadingIcon!,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            : null,
        title: Text(
          title,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: Colors.black,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subtitle1,
              style: GoogleFonts.roboto(
                color: color,
                fontSize: subtitleFontSize ?? 11,
                fontWeight: fontWeight,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle2,
              style: GoogleFonts.roboto(
                color: AppColors.black,
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        trailing: useCounter
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove, color: Colors.red),
                    onPressed: onDecrement,
                  ),
                  // Obx(() => Text(
                  //       '${orderController.quantity.value}', // Display quantity
                  //       style: GoogleFonts.roboto(
                  //         fontSize: 14,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     )),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.green),
                    onPressed: onIncrement,
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (editIcon != null)
                    GestureDetector(
                      onTap: onEdit,
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Image.asset(editIcon!, fit: BoxFit.contain),
                      ),
                    ),
                  const SizedBox(width: 10),
                  if (deleteIcon != null)
                    GestureDetector(
                      onTap: onDelete,
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Image.asset(deleteIcon!, fit: BoxFit.contain),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
