import 'package:flutter/material.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_routes.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/text_style.dart';
import '../../../core/utils/widgets/elevated_button_widget.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppAssets.movePoster, fit: BoxFit.fill),
          Align(
            alignment: .bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.screenHeight * .02,
                horizontal: SizeConfig.screenWidth * .04,
              ),
              child: Column(
                crossAxisAlignment: .center,
                spacing: SizeConfig.screenHeight * .01,
                mainAxisSize: .min,

                children: [
                  Text(
                    "Find Your Next\nFavorite Movie Here",
                    style: AppTextStyle.bold24White.copyWith(
                      fontSize: 36,
                      fontWeight: .w500,
                    ),
                    textAlign: .center,
                  ),

                  Text(
                    "Get access to a huge library of movies to suit all tastes. You will surely like it. ",
                    style: AppTextStyle.regular20Weight.copyWith(
                      fontSize: 18,
                      color: AppColors.whiteColor.withAlpha(153),
                    ),
                  ),
                  ElevatedButtonWidget(
                    onpPressed: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(AppRoutes.onBoardingScreen);
                    },
                    text: "Explore Now",
                  ),
                  SizedBox(height: SizeConfig.screenHeight * .04),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
