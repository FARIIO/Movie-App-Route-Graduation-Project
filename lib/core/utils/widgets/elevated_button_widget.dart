import 'package:flutter/material.dart';
import '../app_colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  ElevatedButtonWidget({
    required this.onpPressed,
    this.backgroundColor=AppColors.yellowColor,
    this.foregroundColor=AppColors.whiteColor,
    required this.text,
    this.colorText = AppColors.blackColor,
    this.colorBorderSide,

  });

  void Function()? onpPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? colorText;
  final Color? colorBorderSide;
  final String text;



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:  backgroundColor ,
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
          side: BorderSide(
            color: colorBorderSide??Colors.transparent,
            width: 2
          )
        ),
        minimumSize: const Size.fromHeight(56),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: .w600, color: colorText),
      ),
    );
  }
}
