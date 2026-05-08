import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_graduation_project_route/core/utils/dimensions.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_style.dart';

class CustomTabBar extends StatefulWidget {
  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;

  final List<String> movieCategories = [
    'action', 'adventure', 'animation', 'biography',
    'comedy', 'crime', 'documentary', 'drama',
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.screenHeight * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: movieCategories.length,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return InkWell(
                  overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  onTap:() {
                    selectedIndex = index;
                    setState(() {

                    });
                  } ,
                  child: InkWell(
                    overlayColor: WidgetStatePropertyAll(Colors.transparent),
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.yellowColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.yellowColor,
                          width: 1.5,
                        ),
                      ),
                      child: Text(
                        movieCategories[index].tr(),
                        style: AppTextStyle.regular16Weight.copyWith(
                          color: isSelected
                              ? AppColors.blackColor
                              : AppColors.yellowColor,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}