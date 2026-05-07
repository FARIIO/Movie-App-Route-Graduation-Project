import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/dimensions.dart';

class CustomShowItemAvatar extends StatelessWidget {
   CustomShowItemAvatar({required this.cIndex,required this.avatarList,required this.onTap});
 int cIndex;
 List<String>avatarList;
   void Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth*.02,
        vertical: SizeConfig.screenHeight*.04,
      ),
      color: AppColors.greyColor,
      child: GridView.builder(
        padding: EdgeInsets.all(SizeConfig.screenWidth*.01),

        itemCount: avatarList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap:(){
              onTap(index);
            },
            child: Container(

              margin: EdgeInsets.all(SizeConfig.screenWidth*.02),
              padding: EdgeInsets.all(SizeConfig.screenWidth*.02),
              decoration: BoxDecoration(
                color: cIndex==index?AppColors.lightBrownColor:Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                    color: AppColors.yellowColor,
                    width: 2
                ),

              ),
              child: Image.asset(avatarList[index]),
            ),
          );
        },
      ),
    );
  }
}
