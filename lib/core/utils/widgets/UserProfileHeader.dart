import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/text_style.dart';

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              Column(
                children: [
                  Text(
                    "12",
                    style: AppTextStyle.bold24White.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Text(
                    "Wish List",
                    style: AppTextStyle.bold24White.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "12",
                    style: AppTextStyle.bold24White.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Text(
                    "Wish List",
                    style: AppTextStyle.bold24White.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "John Safwat",
            style: AppTextStyle.bold24White.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yellowColor,
                  ),
                  child: Text(
                    "Edit Profile",
                    style: AppTextStyle.regular20Weight.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.redColor,
                ),
                child: Icon(Icons.exit_to_app, color: AppColors.whiteColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
