import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/text_style.dart';

class MoviePoster extends StatelessWidget {
  final String imagePath;
  final String rating;

  const MoviePoster({super.key, required this.imagePath, this.rating = "7.7"});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.darkGreyColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.whiteColor, width: 0.5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  rating,
                  style: AppTextStyle.regular16Weight.copyWith(
                    color: AppColors.whiteColor,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.star, color: AppColors.yellowColor, size: 14),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
