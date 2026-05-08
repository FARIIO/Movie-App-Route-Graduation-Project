
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../app_colors.dart';
import '../dimensions.dart';

class ShowDialogUtils {


  static void showLoading({required BuildContext context}) {
    SizeConfig.init(context);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding:  EdgeInsets.symmetric(
              vertical: SizeConfig.screenHeight*.02,
              horizontal: SizeConfig.screenWidth*.02,),
          decoration: BoxDecoration(
            color: AppColors.darkGreyColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SpinKitThreeBounce(
                color: AppColors.yellowColor,
                size: 30,
              ),
               SizedBox(height: SizeConfig.screenHeight*.01),
              const Text(
                "Loading...",
                style: TextStyle(color: AppColors.whiteColor, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }


  static void showError({
    required BuildContext context,
    required String errorMessage,
  }) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding:  EdgeInsets.all(SizeConfig.screenHeight*.02,),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.screenHeight*.02,),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline,
                  color:AppColors.redColor , size: 50),
               SizedBox(height: SizeConfig.screenHeight*.01),
              Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
               SizedBox(height: SizeConfig.screenHeight*.02,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.yellowColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(SizeConfig.screenHeight*.01),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              )
            ],
          ),
        ),
      ),
    );
  }


  static void showSuccess({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.screenHeight*.02,),
        ),
        child: Container(
          padding:  EdgeInsets.all(SizeConfig.screenHeight*.02,),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.screenHeight*.02,),
            color: AppColors.whiteColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle,
                  color: AppColors.greenColor, size: 50),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style:  TextStyle(fontSize: 16),
              ),
               SizedBox(height: SizeConfig.screenHeight*.02,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.yellowColor,
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              )
            ],
          ),
        ),
      ),
    );
  }


  static void pop({required BuildContext context}) {
    Navigator.pop(context);
  }
}