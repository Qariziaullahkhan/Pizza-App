import 'package:flutter/material.dart';

class MySize extends StatelessWidget {
  final double? height;
  final double? width;
const MySize({super.key,this.height,this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}